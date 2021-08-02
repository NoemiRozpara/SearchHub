//
//  NAImageLoader.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 2/8/21.
//

import SwiftUI
import Combine
import Foundation

class ImageLoader: ObservableObject {
    private var cancellable: AnyCancellable?
    
    private var cache: ImageCacheProtocol?
    
    private static let imageProcessingQueue = DispatchQueue(label: "image-processing")
    
    private let url: URL
    
    private(set) var isLoading = false
    
    @Published var image: UIImage?
    
    init(
        url: URL,
        cache: ImageCacheProtocol? = nil
    ) {
        self.url = url
        self.cache = cache
    }
    
    deinit {
        cancel()
    }
    
    func load() {
        guard !isLoading else {
            return
        }
        
        if let image = cache?[url] {
            self.image = image
            return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: Self.imageProcessingQueue)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .handleEvents(
                receiveSubscription: { [weak self] _ in self?.onStart() },
                receiveOutput: { [weak self] in self?.cache($0) },
                receiveCompletion: { [weak self] _ in self?.onFinish() },
                receiveCancel: { [weak self] in self?.onFinish() }
            )
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
    
    private func cache(_ image: UIImage?) {
        image.map { cache?[url] = $0 }
    }
    
    private func onStart() {
        isLoading = true
    }
    
    private func onFinish() {
        isLoading = false
    }

}

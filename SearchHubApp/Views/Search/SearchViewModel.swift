//
//  SearchViewModel.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import Foundation
import SwiftUI
import Combine

class SearchViewModel: ObservableObject {
    
    @Published public var query: String = ""
    
    @Published var results: [Repository] = []
    
    @Published var isLoading = false
    
    @Published var error: String?
    
    private let model: SearchModel
    
    private weak var coordinatorDelegate: ApplicationCoordinatorDelegate?
    
    private var cancellables: [AnyCancellable] = []
    
    private var currentPage: Int = 0
    
    private var totalPages: Int = 0
    
    init(
        model: SearchModel,
        coordinatorDelegate: ApplicationCoordinatorDelegate?
    ) {
        self.model = model
        self.coordinatorDelegate = coordinatorDelegate
    }
    
    func showDetails(using url: URL) {
        coordinatorDelegate?.openDetails(using: url)
    }
    
    func search(_ query: String) {
        error = nil
        isLoading = true
        model.search(query)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    guard let self = self else {
                        return
                    }
                    
                    self.isLoading = false
                    switch completion {
                    case .failure(let error):
                        print(error)
                        self.results = []
                        self.error = error.localizedDescription
                    case .finished:
                        self.error = nil
                    }
                },
                receiveValue: { [weak self] response in
                    guard let self = self else {
                        return
                    }
                    
                    if response.incompleteResults == true {
                        self.error = "Error occured, please try again"
                    } else {
                        self.results = response.items
                        self.currentPage = 1
//                        self.totalPages = response.
                    }
                }
            ).store(in: &cancellables)
    }
    
    func loadMore() {
//        let newItems = (1 ... 10).map { _ in
//            repositoryMock(id: "\(UUID().hashValue)")
//        }
//        results.append(contentsOf: newItems)
    }
}

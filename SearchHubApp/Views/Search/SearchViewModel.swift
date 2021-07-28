//
//  SearchViewModel.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import Foundation
import SwiftUI

class SearchViewModel: ObservableObject {
    
    @Published public var query: String = ""
    
    @Published var detailsURL: URL?
    
    @Published var results: [Repository]
    
    @Published var isLoading = true
    
    @Published var isPresentingDetails = false
    
    private let model: SearchModel
    
    //    let coordinator: CoordinatorModel
    
    init(model: SearchModel) {
        self.model = model
        results = (1 ... 10).map { _ in
            repositoryMock(id: "\(UUID().hashValue)")
        }
    }
    
    func showDetails(using url: URL) {
//        coordinator.open(url)
    }
    
    func loadMore() {
        let newItems = (1 ... 10).map { _ in
            repositoryMock(id: "\(UUID().hashValue)")
        }
        results.append(contentsOf: newItems)
    }
}

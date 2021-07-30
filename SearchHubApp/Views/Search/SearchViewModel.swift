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
    
    @Published var query: String = ""
    
    @Published var results: [Repository] = []
    
    @Published var isLoading = false
    
    @Published var error: String?
    
    private let model: SearchModel
    
    private weak var coordinatorDelegate: NavigatorProtocol?
    
    private var cancellables: [AnyCancellable] = []
    
    
    init(
        model: SearchModel,
        coordinatorDelegate: NavigatorProtocol?
    ) {
        self.model = model
        self.coordinatorDelegate = coordinatorDelegate
        
        model.$results.sink { results in
            self.results = results
        }.store(in: &cancellables)
        
        model.$error.sink { error in
            self.error = error
        }.store(in: &cancellables)
        
        model.$isLoading.sink { isLoading in
            self.isLoading = isLoading
        }.store(in: &cancellables)
        
        model.$query.sink { query in
            self.query = query
        }.store(in: &cancellables)
    }
    
    func showDetails(using url: URL) {
        coordinatorDelegate?.openDetails(using: url)
    }
    
    func search(_ query: String) {
        model.search(query)
    }
    
    func loadMore() {
        model.loadMore()
    }
}

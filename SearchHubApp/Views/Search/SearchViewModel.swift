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
    
    @Published var hasMoreResults = false
    
    @Published var error: String?
    
    private let model: SearchModel
    
    private weak var coordinatorDelegate: NavigatorProtocol?
    
    private var cancellables: [AnyCancellable] = []
    
    private var lastCallerID: Int = 0
    
    
    init(
        model: SearchModel,
        coordinatorDelegate: NavigatorProtocol?
    ) {
        self.model = model
        self.coordinatorDelegate = coordinatorDelegate
        
        model.$results.sink { [weak self] results in
            guard let self = self else { return }
            self.results = results
        }.store(in: &cancellables)
        
        model.$error.sink { [weak self] error in
            guard let self = self else { return }
            self.error = error
        }.store(in: &cancellables)
        
        model.$isLoading.sink { [weak self] isLoading in
            guard let self = self else { return }
            self.isLoading = isLoading
        }.store(in: &cancellables)
        
        model.$hasMoreResults.sink { [weak self] hasMoreResults in
            guard let self = self else { return }
            self.hasMoreResults = hasMoreResults
        }.store(in: &cancellables)
    }
    
    func showDetails(using url: URL) {
        coordinatorDelegate?.openDetails(using: url)
    }
    
    func search(_ query: String) {
        model.search(query)
    }
    
    func loadMore() {
        guard lastCallerID != results.last?.id else {
            return
        }
        lastCallerID = results.last?.id ?? 0
        model.loadMore(query)
    }
}

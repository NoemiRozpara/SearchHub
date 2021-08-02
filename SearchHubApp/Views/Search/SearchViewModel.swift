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
    
    private var cancellables: [AnyCancellable] = []
    
    private let model: SearchModel
    
    private weak var coordinatorDelegate: NavigatorProtocol?
    
    @Published var query: String = ""
    
    @Published private(set) var results: [Repository] = []
    
    @Published private(set) var isLoading = false
    
    @Published private(set) var hasMoreResults: Bool = false

    @Published private(set) var error: String?
    
    @Published private(set) var resultsCountMessage: String = ""
    
    @Published private(set) var totalResults: Int = 0
    
    init(
        model: SearchModel,
        coordinatorDelegate: NavigatorProtocol?
    ) {
        self.model = model
        self.coordinatorDelegate = coordinatorDelegate
        
        model.results.sink { [weak self] results in
            guard let self = self else { return }
            self.results = results
        }.store(in: &cancellables)
        
        model.error.sink { [weak self] error in
            guard let self = self else { return }
            self.error = error
        }.store(in: &cancellables)
        
        model.isLoading.sink { [weak self] isLoading in
            guard let self = self else { return }
            self.isLoading = isLoading
        }.store(in: &cancellables)
        
        model.currentPage
            .combineLatest(model.totalPages)
            .map { (current, totalPages) in
                current < totalPages
            }.sink { [weak self] isNotLast in
                self?.hasMoreResults = isNotLast
            }.store(in: &cancellables)
        
        model.currentPage
            .combineLatest(model.totalPages)
            .map { (current, totalPages) in
                return current != 0
                ? "Displaying \(current) page out of \(totalPages)"
                : ""
            }.sink { [weak self] message in
                self?.resultsCountMessage = message
            }.store(in: &cancellables)
    }
    
    func showDetails(using url: URL) {
        coordinatorDelegate?.openDetails(using: url)
    }
    
    func search(_ query: String) {
        model.resetSearch()
        model.search(query)
    }
    
    func loadMore() {
        model.loadMore(query)
    }
    
    func resetSearch() {
        model.resetSearch()
    }
}

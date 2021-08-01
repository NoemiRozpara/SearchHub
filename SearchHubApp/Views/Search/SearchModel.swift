//
//  SearchModel.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import Foundation
import Combine
import SwiftUI

class SearchModel: ObservableObject {
    private let searchService: SearchServiceProtocol
    
    private var cancellables: [AnyCancellable] = []
    
    private let resultsPerPage: Int
    
    let currentPage = CurrentValueSubject<Int, Never>(0)
    
    let totalPages = CurrentValueSubject<Int, Never>(0)
    
    let results = CurrentValueSubject<[Repository], Never>([])
    
    let error = PassthroughSubject<String?, Never>()
    
    let isLoading = PassthroughSubject<Bool, Never>()
    
    init(searchService: SearchServiceProtocol) {
        self.searchService = searchService
        resultsPerPage = searchService.resultsPerPage
    }
 
    func search(_ query: String) {
        startSearchState()
        searchService.search(query: query)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.receiveCompletion(completion, resetResultsOnError: true)
                },
                receiveValue: { [weak self] response in
                    self?.receiveResponse(response, overrideResults: true)
                }
            ).store(in: &cancellables)
    }
    
    func loadMore(_ query: String) {
        guard currentPage.value < totalPages.value else {
            return
        }
        startSearchState(incrementCurrentPage: true)
        searchService.loadMore(query: query, page: currentPage.value)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    self?.receiveCompletion(completion)
                },
                receiveValue: { [weak self] response in
                    self?.receiveResponse(response)
                }
            ).store(in: &cancellables)
    }
    
    func resetSearch() {
        self.results.send([])
        self.currentPage.send(0)
        self.totalPages.send(0)
    }
}

private extension SearchModel {
    func receiveCompletion(
        _ completion: Subscribers.Completion<Error>,
        resetResultsOnError: Bool = false
    ) {
        isLoading.send(false)
        switch completion {
        case .failure(let error):
            self.error.send(error.localizedDescription)
            if resetResultsOnError {
                results.send([])
            }
        case .finished:
            return
        }
    }
    
    func receiveResponse(
        _ response: SearchEndpoint.Response,
        overrideResults: Bool = false
    ) {
        let results = overrideResults
            ? response.items
            : self.results.value + response.items
        self.results.send(results)
        self.totalPages.send(response.totalPages)
    }
    
    func startSearchState(incrementCurrentPage: Bool = true) {
        error.send(nil)
        isLoading.send(true)
        let page = incrementCurrentPage ? currentPage.value + 1 : 1
        currentPage.send(page)
    }
}

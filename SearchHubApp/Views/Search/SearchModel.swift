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
    
    private var currentPage: Int = 0
    
    private var totalPages: Int = 0
    
    @Published private(set) var results: [Repository] = []
    
    @Published private(set) var error: String? = nil
    
    @Published private(set) var isLoading = false
    
    @Published private(set) var hasMoreResults = false
    
    init(searchService: SearchServiceProtocol) {
        self.searchService = searchService
    }
 
    func search(_ query: String) {
        error = nil
        isLoading = true
        currentPage = 1
        searchService.search(query: query)
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
                        self.totalPages = self.getTotalPages(
                            totalResults: response.totalCount,
                            perPage: self.searchService.resultsPerPage
                        )
                        self.hasMoreResults = self.currentPage < self.totalPages
                    }
                }
            ).store(in: &cancellables)
    }
    
    func loadMore(_ query: String) {
        guard currentPage < totalPages else {
            return
        }
        error = nil
        isLoading = true
        currentPage += 1
        searchService.loadMore(query: query, page: currentPage)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    guard let self = self else { return }
                    
                    self.isLoading = false
                    switch completion {
                    case .failure(let error):
                        print(error)
                        self.error = error.localizedDescription
                    case .finished:
                        self.error = nil
                    }
                },
                receiveValue: { [weak self] response in
                    guard let self = self else { return }
                    
                    if response.incompleteResults == true {
                        self.error = "Error occured, please try again"
                    } else {
                        self.results.append(contentsOf: response.items)
                        self.totalPages = self.getTotalPages(
                            totalResults: response.totalCount,
                            perPage: self.searchService.resultsPerPage
                        )
                        self.hasMoreResults = self.currentPage < self.totalPages
                    }
                }
            ).store(in: &cancellables)
    }
    
    private func getTotalPages(
        totalResults: Int,
        perPage: Int
    ) -> Int {
        let rounded = round(Double(totalResults) / Double(perPage))
        return Int(rounded)
    }
}

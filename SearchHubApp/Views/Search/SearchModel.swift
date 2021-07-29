//
//  SearchModel.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import Foundation
import Combine

struct SearchModel {
    private let searchService: SearchServiceProtocol
    
    init(searchService: SearchServiceProtocol) {
        self.searchService = searchService
    }
 
    func search(_ query: String) -> AnyPublisher<SearchEndpoint.Response, Error> {
        searchService.search(query: query)
    }
}

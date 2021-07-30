//
//  SearchServiceMock.swift
//  SearchHubAppTests
//
//  Created by Noemi Rozpara on 29/7/21.
//

import Foundation
import Combine

struct SearchServiceMock: SearchServiceProtocol {
    private let mockPublisher = Result<SearchEndpoint.Response, Error>{
        let items = (1 ... 10).map { _ in
            makeRepositoryMock(id: UUID().hashValue)
        }
        return SearchEndpoint.Response(
            totalCount: 99,
            incompleteResults: false,
            items: items
        )
    }
    .publisher.eraseToAnyPublisher()
    
    var resultsPerPage: Int = 30
    
    func search(query: String) -> AnyPublisher<SearchEndpoint.Response, Error> {
        mockPublisher
    }
    
    func loadMore(query: String, page: Int) -> AnyPublisher<SearchEndpoint.Response, Error> {
        mockPublisher
    }
}

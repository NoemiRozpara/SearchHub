//
//  SearchService.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import Foundation
import Combine

struct SearchService {
    
    private let session: URLSession
    private let decoder: JSONDecoder
    
    let resultsPerPage: Int = 30
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
        decoder = JSONDecoder.withFormatters()
    }
}

extension SearchService: SearchServiceProtocol {
    func search(query: String) -> AnyPublisher<SearchEndpoint.Response, Error> {
        executeSearch(query: query)
    }
    
    func loadMore(query: String, page: Int) -> AnyPublisher<SearchEndpoint.Response, Error> {
        executeSearch(query: query, page: page)
    }
}

private extension SearchService {
    func executeSearch(query: String, page: Int = 1) -> AnyPublisher<SearchEndpoint.Response, Error> {
        do {
            let request = try SearchEndpoint.makeRequest(
                using: [
                    "query" : query,
                    "page": page
                ]
            )
            return session.dataTaskPublisher(for: request)
                .tryMap { (data, response) in
                    try SearchEndpoint.validate(data, response)
                }
                .decode(type: SearchEndpoint.Response.self, decoder: decoder)
                .eraseToAnyPublisher()
        } catch let error {
            return Fail(error: error).eraseToAnyPublisher()
        }
    }
}

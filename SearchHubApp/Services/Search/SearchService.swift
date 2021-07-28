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
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
        decoder = JSONDecoder.withFormatters()
    }
    
    func search(query: String) -> AnyPublisher<SearchEndpoint.Response, Error> {
        do {
            let request = try SearchEndpoint.makeRequest(using: ["query" : query])
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

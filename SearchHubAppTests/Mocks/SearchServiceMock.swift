//
//  SearchServiceMock.swift
//  SearchHubAppTests
//
//  Created by Noemi Rozpara on 29/7/21.
//

import Foundation
import Combine

struct SearchServiceMock: SearchServiceProtocol {
    func search(query: String) -> AnyPublisher<SearchEndpoint.Response, Error> {
        Result<SearchEndpoint.Response, Error>{
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
    }
}

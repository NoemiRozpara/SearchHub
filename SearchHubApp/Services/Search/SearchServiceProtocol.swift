//
//  SearchServiceProtocol.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 29/7/21.
//

import Foundation
import Combine

protocol SearchServiceProtocol {
    func search(query: String) -> AnyPublisher<SearchEndpoint.Response, Error>
    func loadMore(query: String, page: Int) -> AnyPublisher<SearchEndpoint.Response, Error>
}

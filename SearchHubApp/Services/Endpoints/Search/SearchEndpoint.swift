//
//  SearchEndpoint.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import Foundation

enum SearchEndpoint: EndpointProtocol {
    
    static let config: EndpointConfig = EndpointConfig(
        scheme: "https",
        host: "api.github.com",
        path: "/search/repositories"
    )
    
    enum RequestError: Error {
        case invalidArguments
        case invalidBody
        case invalidEndpoint
        case invalidURL
        case emptyData
        case invalidJSON
        case invalidResponse
        case statusCode(Int)
        case other(Error)
        
        static func map(_ error: Error) -> RequestError {
            return (error as? RequestError) ?? .other(error)
        }
    }
    
    typealias Response = SearchResponseModel
    
    /// Executes repository search using given `arguments`.
    ///
    /// - Parameter using: Dictionary of search arguments. Accepts following:
    ///     - `query` - search phrase - mandatory
    ///     - `page` - results page, default `1`
    ///     - `perPage` - resullts per page, default `30`
    /// - Returns: `SearchResponseModel`
    /// 
    /// Read more: https://docs.github.com/en/rest/reference/search#search-repositories
    
    static func makeRequest(using arguments: [String : Decodable]) throws -> URLRequest {
        guard let query = arguments["query"] as? String else {
            throw RequestError.invalidArguments
        }
        let page = arguments["page"] as? Int ?? 1
        let perPage = arguments["perPage"] as? Int ?? 30
        let queryItems = [
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "per_page", value: "\(perPage)")
        ]
        let components = URLRequestFactory.makeURLComponents(using: config, with: queryItems)
        
        guard let url = components.url else {
            throw RequestError.invalidURL
        }
        
        return URLRequestFactory.makeRequest(from: url)
    }
    
    static func validate(_ data: Data, _ response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw RequestError.invalidResponse
        }
        guard (200 ..< 300).contains(httpResponse.statusCode) else {
            throw RequestError.statusCode(httpResponse.statusCode)
        }
        return data
    }
}

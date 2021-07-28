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
    
    struct Response: Codable {
        var total_count: Int
        var incomplete_results: Bool
        var items: [Repository]
    }
    
    static func makeRequest(using arguments: [String : Decodable]) throws -> URLRequest {
        guard let query = arguments["query"] as? String else {
            throw RequestError.invalidArguments
        }
        
        let queryItems = [URLQueryItem(name: "q", value: query)]
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

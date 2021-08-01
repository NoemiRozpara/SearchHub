//
//  EndpointProtocol.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import Foundation



protocol EndpointProtocol {
    associatedtype RequestError
    associatedtype Response
    
    static var config: EndpointConfig { get }
    
    static func makeRequest(using arguments: [String: Decodable]) throws -> URLRequest
    static func validate(_ data: Data, _ response: URLResponse) throws -> Data
}

struct EndpointConfig {
    let scheme: String
    let host: String
    let path: String
}

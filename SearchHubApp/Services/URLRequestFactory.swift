//
//  URLRequestFactory.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import Foundation

enum URLRequestFactory {
    static func makeRequest(from url: URL) -> URLRequest {
        let headers = [
            "Content-Type": "application/json",
            "cache-control": "no-cache",
            "accept": "application/vnd.github.v3+json",
            // add user token etc
        ]
        
        var request = URLRequest(
            url: url,
            cachePolicy: .useProtocolCachePolicy,
            timeoutInterval: 10.0
        )
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        
        return request
    }
    
    static func makeURLComponents(
        using config: EndpointConfig,
        with queryItems: [URLQueryItem]
    ) -> URLComponents {
        var components = URLComponents()
        
        components.scheme = config.scheme
        components.host = config.host
        components.path = config.path
        
        components.queryItems = queryItems
        
        return components
    }
}

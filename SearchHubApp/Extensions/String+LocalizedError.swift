//
//  String+LocalizedError.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import Foundation

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}

//
//  SearchResponseModel.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 1/8/21.
//

import Foundation

struct SearchResponseModel: Codable {
    var totalCount: Int
    var incompleteResults: Bool
    var items: [Repository]
    
    func getTotalPages(resultsPerPage: Int) -> Int {
        Int.divideRoundUp(items.count, resultsPerPage)
    }
}

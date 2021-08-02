//
//  SearchResponseModel.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 1/8/21.
//

import Foundation

struct SearchResponseModel: Codable {
    var totalCount: Int
    var items: [Repository]
    
    var totalPages: Int {
        guard items.count > 0 else {
            return 0
        }
        return Int.divideRoundUp(totalCount, items.count)
    }
}

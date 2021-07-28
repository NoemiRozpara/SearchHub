//
//  File.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import Foundation

protocol ApplicationCoordinatorDelegate: AnyObject {
    func openRepository(using url: URL)
}

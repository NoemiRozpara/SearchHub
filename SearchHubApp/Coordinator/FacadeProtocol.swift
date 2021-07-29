//
//  FacadeProtocol.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import UIKit

protocol FacadeProtocol {
    func makeSearchView(coordinatorDelegate: NavigatorProtocol) -> UIViewController
    
    func makeDetailsView(using url: URL) -> UIViewController
}

//
//  MainCoordinator.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import UIKit

class ApplicationCoordinator: CoordinatorProtocol {
    
    let window: UIWindow
    let rootViewController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}

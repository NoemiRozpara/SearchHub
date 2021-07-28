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
    private let facade: FacadeProtocol
    
    init(
        window: UIWindow,
        facade: FacadeProtocol = Facade()
    ) {
        self.facade = facade
        self.window = window
        rootViewController = UINavigationController()
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        let searchView = facade.makeSearchView(coordinatorDelegate: self)
        rootViewController.pushViewController(searchView, animated: false)
    }
}

extension ApplicationCoordinator: ApplicationCoordinatorDelegate {
    func openRepository(using url: URL) {
        print("open \(url)")
    }
}

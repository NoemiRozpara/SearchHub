//
//  MainCoordinator.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import UIKit
import SafariServices

class Coordinator: CoordinatorProtocol {
    
    let window: UIWindow
    
    private lazy var rootViewController: UIViewController = {
        facade.makeSearchView(coordinatorDelegate: self)
    }()
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        return navigationController
    }()
    
    private let facade: FacadeProtocol
    
    init(
        window: UIWindow,
        facade: FacadeProtocol = Facade()
    ) {
        self.facade = facade
        self.window = window
    }
    
    func start() {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        navigationController.setNavigationBarHidden(true, animated: false)
    }
}

extension Coordinator: NavigatorProtocol {
    func openDetails(using url: URL) {
        let detailsView = facade.makeDetailsView(using: url)
        navigationController.present(detailsView, animated: true)
    }
}

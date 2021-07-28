//
//  Facade.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import UIKit
import SafariServices

class Facade: FacadeProtocol {
    func makeSearchView(coordinatorDelegate: ApplicationCoordinatorDelegate) -> UIViewController {
        let model: SearchModel = SearchModel()
        let viewModel: SearchViewModel = SearchViewModel(
            model: model,
            coordinatorDelegate: coordinatorDelegate
        )
        return SearchViewController(viewModel: viewModel)
    }
    
    func makeDetailsView(using url: URL) -> UIViewController {
        let configuration = SFSafariViewController.Configuration()
        configuration.entersReaderIfAvailable = true
        return SFSafariViewController(url: url, configuration: configuration)
    }
}

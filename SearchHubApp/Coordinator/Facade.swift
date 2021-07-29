//
//  Facade.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import UIKit

class Facade: FacadeProtocol {
    func makeSearchView(coordinatorDelegate: ApplicationCoordinatorDelegate) -> UIViewController {
        let model: SearchModel = SearchModel(searchService: SearchService())
        let viewModel: SearchViewModel = SearchViewModel(
            model: model,
            coordinatorDelegate: coordinatorDelegate
        )
        return SearchViewController(viewModel: viewModel)
    }
    
    func makeDetailsView(using url: URL) -> UIViewController {
        DetailViewController(url: url)
    }
}

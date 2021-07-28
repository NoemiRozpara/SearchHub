//
//  Facade.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import UIKit

class Facade: FacadeProtocol {
    func makeSearchView() -> UIViewController {
        let model: SearchModel = SearchModel()
        let viewModel: SearchViewModel = SearchViewModel(model: model)
        return SearchViewController(viewModel: viewModel)
    }
}

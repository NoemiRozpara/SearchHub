//
//  SearchViewController.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import UIKit
import Combine
import SwiftUI

final class SearchViewController: UIViewController {
    
    // MARK: - Variables
    private let viewModel: SearchViewModel
    
    private lazy var contentView: some View = {
        SearchContentView(viewModel: viewModel).environmentObject(Theme())
    }()
    
    // MARK: - Life Cycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.navigationController!.navigationBar.isHidden = true
//        layout
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController!.navigationBar.isHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displaySwiftUIView(self.contentView)
    }
}

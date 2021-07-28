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
    
    private lazy var contentView: some View = SearchContentView()
    
    // MARK: - Life Cycle
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displaySwiftUIView(self.contentView)
    }
}

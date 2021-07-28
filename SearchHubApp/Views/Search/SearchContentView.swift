//
//  SearchContentView.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import Foundation
import SwiftUI
import UIKit

struct SearchContentView: View {
    @EnvironmentObject var theme: Theme
    
    @ObservedObject var viewModel: SearchViewModel
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Logo()
            SearchField(query: $viewModel.query)
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.results, id: \.id) { result in
                        makeSearchResult(using: result).id(UUID())
                    }
                    if viewModel.isLoading {
                        ProgressView()
                    }
                }
            }
        }
    }
    
    @ViewBuilder private func makeSearchResult(using repository: Repository) -> some View {
        Button(action: {
            viewModel.showDetails(using: repository.url)
        }, label: {
            SearchResultView(result: repository)
                .listRowInsets(.init())
                .onAppear {
                    if repository.id == viewModel.results.last?.id {
                        viewModel.loadMore()
                    }
                }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchContentView(
            viewModel: SearchViewModel(
                model: SearchModel(),
                coordinatorDelegate: nil
            )
        ).environmentObject(Theme())
    }
}

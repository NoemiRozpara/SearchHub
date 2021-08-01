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
            SearchField(query: $viewModel.query) { query in
                viewModel.search(query)
            }
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.results, id: \.id) { result in
                        makeSearchResult(using: result).id(UUID())
                    }
                    Text(viewModel.resultsCountMessage)
                        .font(.caption)
                    if viewModel.isLoading {
                        ProgressView()
                    } else if viewModel.hasMoreResults {
                        SHButton(
                            label: "Load More",
                            iconName: "chevron.down",
                            action: viewModel.loadMore
                        )
                    }
                }
            }
        }
    }
    
    @ViewBuilder private func makeSearchResult(using repository: Repository) -> some View {
        Button(action: {
            viewModel.showDetails(using: repository.htmlUrl)
        }, label: {
            SearchResultView(result: repository)
                .listRowInsets(.init())
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchContentView(
            viewModel: SearchViewModel(
                model: SearchModel(searchService: SearchServiceMock()),
                coordinatorDelegate: nil
            )
        ).environmentObject(Theme())
    }
}

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
            SHLogo()
            SHSearchField(
                query: $viewModel.query,
                executeSearch: { query in
                    viewModel.search(query)
                },
                clearAction: viewModel.resetSearch
            )
            ScrollView(.vertical, showsIndicators: false) {
                if viewModel.results.count > 0 {
                    LazyVStack {
                        ForEach(viewModel.results, id: \.id) { result in
                            makeSearchResult(using: result).id(UUID())
                        }
                        if viewModel.isLoading {
                            ProgressView()
                        } else {
                            Text(viewModel.resultsCountMessage)
                                .font(.caption)
                            viewModel.hasMoreResults
                                ? SHButton(
                                    label: "Load More",
                                    iconName: "chevron.down",
                                    action: viewModel.loadMore
                                )
                                : nil
                        }
                    }
                } else if viewModel.error != nil {
                    Text(viewModel.error!)
                } else {
                    EmptyPlaceholder()
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

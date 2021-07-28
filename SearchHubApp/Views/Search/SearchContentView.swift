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
            Text("SearchHub")
                .font(.headline)
                .foregroundColor(theme.colorPalette.accent)
            SearchField(query: $viewModel.query)
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.results, id: \.id) { result in
                        URL(string: result.url) != nil
                            ? Button(action: {
                                viewModel.showDetails(using: URL(string: result.url)!)
                            }, label: {
                                SearchResultView(result: result)
                                    .listRowInsets(.init())
                                    .onAppear {
                                        if result.id == viewModel.results.last?.id {
                                            viewModel.loadMore()
                                        }
                                    }
                            }).id(UUID())
                            : nil
                    }
                    if viewModel.isLoading {
                        ProgressView()
                    }
                }
            }
        }
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

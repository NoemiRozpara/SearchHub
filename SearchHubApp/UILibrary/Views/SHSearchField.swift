//
//  SearchField.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import SwiftUI

struct SHSearchField: View {
    var query: Binding<String>
    
    @State private var isEditing = false
    
    private let executeSearch: ((String) -> Void)?
    
    init(
        query: Binding<String>,
        executeSearch: ((String) -> Void)? = nil
    ) {
        self.query = query
        self.executeSearch = executeSearch
    }
    
    var body: some View {
        HStack {
            TextField(
                "Search ...",
                text: query,
                onEditingChanged: { isEditing in
                    self.isEditing = true
                }, onCommit: {
                    self.executeSearch?(query.wrappedValue)
                })
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        SHIcon(name: "magnifyingglass")
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                            .padding(.leading, 8)
                        if isEditing && !query.wrappedValue.isEmpty {
                            Button(action: {
                                query.wrappedValue = ""
                            }) {
                                SHIcon(name: "multiply.circle.fill")
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .onTapGesture {
                    isEditing = true
                }
            
            
            if isEditing {
                Button(action: clearQueryAndResign) {
                    Text("Cancel")
                }
                .padding(.vertical, 0)
                .padding(.trailing, 10)
            }
        }
    }
    
    private func clearQueryAndResign() {
        UIApplication.shared
            .sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
        query.wrappedValue = ""
        isEditing = false
        
    }
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SHSearchField(
            query: .constant(""),
            executeSearch: nil
        ).environmentObject(Theme())
    }
}

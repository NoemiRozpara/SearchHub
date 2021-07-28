//
//  SearchField.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import SwiftUI

struct SearchField: View {
    @Binding var query: String
    
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            TextField("Search ...", text: $query)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Icon(name: "magnifyingglass")
                            .frame(
                                minWidth: 0,
                                maxWidth: .infinity,
                                alignment: .leading
                            )
                            .padding(.leading, 8)
                        if isEditing && !query.isEmpty {
                            Button(action: {
                                query = ""
                            }) {
                                Icon(name: "multiply.circle.fill")
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
        isEditing = false
        query = ""
        UIApplication.shared
            .sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
    }
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SearchField(query: .constant("")).environmentObject(Theme())
    }
}

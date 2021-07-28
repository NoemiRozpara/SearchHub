//
//  SearchResultView.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import SwiftUI

struct SearchResultView: View {
    @EnvironmentObject var theme: Theme
    
    let result: Repository
    
    var body: some View {
        HStack {
            VStack {
                Text(result.fullName)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.subheadline)
                    .foregroundColor(theme.colorPalette.primaryText)
                Text(result.description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                    .font(.body)
                    .foregroundColor(theme.colorPalette.primaryText)
                HStack {
                    LabelWithIcon(
                        text: "\(result.stargazersCount)",
                        iconName: "star.fill"
                    )
                    LabelWithIcon(
                        text: "\(result.watchersCount)",
                        iconName: "person.fill"
                    )
                    LabelWithIcon(
                        text: result.language,
                        iconName: "gearshape.fill"
                    )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            Spacer()
            Icon(name: "arrow.up.right")
        }
        .padding()
        .background(theme.colorPalette.background)
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(
            result: repositoryMock(id: "123")
        )
        .environmentObject(Theme())
    }
}

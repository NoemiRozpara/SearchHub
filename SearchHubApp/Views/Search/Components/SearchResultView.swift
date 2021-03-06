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
        VStack {
            HStack {
                if result.owner.avatarUrl != nil {
                    SHAsyncImage<SHIcon>(
                        url: result.owner.avatarUrl!,
                        image: { Image(uiImage: $0).resizable() },
                        placeholder: {
                            SHIcon(name: "person.fill")
                        }
                    )
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                } else {
                    SHIcon(name: "person.fill")
                }
               
                VStack {
                    Text(result.fullName)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.subheadline)
                        .foregroundColor(theme.colorPalette.primaryText)
                    Text(result.description ?? " ")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .lineLimit(2)
                        .font(.body)
                        .foregroundColor(theme.colorPalette.primaryText)
                }
                Spacer()
                SHIcon(name: "chevron.right")
            }
            HStack {
                ZStack {
                    SHLabelWithIcon(
                        text: "\(result.stargazersCount)",
                        iconName: "star.fill"
                    )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack {
                    SHLabelWithIcon(
                        text: "\(result.watchersCount)",
                        iconName: "person.fill"
                    )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                ZStack {
                    SHLabelWithIcon(
                        text: result.language ?? "?",
                        iconName: "gearshape.fill"
                    )
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(theme.colorPalette.secondaryBackground)
        
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultView(
            result: makeRepositoryMock(id: UUID().hashValue)
        )
        .environmentObject(Theme())
    }
}

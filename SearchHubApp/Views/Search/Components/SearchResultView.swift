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
                
                SHURLImage(
                    result.owner.avatarUrl,
                    fallbackImageName: "person.fill"
                )
                .frame(width: 40, height: 40)
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
                
                result.language != nil
                    ? ZStack {
                        SHLabelWithIcon(
                            text: result.language!,
                            iconName: "gearshape.fill"
                        )
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    : nil
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(Color(.systemGray6))
        
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

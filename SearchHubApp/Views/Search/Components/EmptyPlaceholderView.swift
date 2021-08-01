//
//  EmptyPlaceholder.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 1/8/21.
//

import SwiftUI

struct EmptyPlaceholderView: View {
    var body: some View {
        SHStackedIconWithText(
            label: "Search for some great repository, try \"Swift\"!",
            iconName: "eyes"
        )
    }
}

struct EmptyPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        EmptyPlaceholderView().environmentObject(Theme())
    }
}

//
//  ErrorView.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 1/8/21.
//

import SwiftUI

struct ErrorView: View {
    let label: String
    
    var body: some View {
        SHStackedIconWithText(
            label: label,
            iconName: "exclamationmark.triangle",
            color: .red
        )
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(label: "Unknown error, try again later").environmentObject(Theme())
    }
}

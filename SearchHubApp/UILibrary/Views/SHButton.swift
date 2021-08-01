//
//  SHButton.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 1/8/21.
//

import SwiftUI

struct SHButton: View {
    @EnvironmentObject var theme: Theme
    
    let label: String
    
    let iconName: String
    
    let action: () -> Void
    
    var body: some View {
        Button(
            action: action,
            label: {
                SHLabelWithIcon(
                    text: label,
                    iconName: iconName,
                    primary: false
                )
                .padding()
                .background(theme.colorPalette.background)
                .clipShape(Capsule())
            }
        )
    }
}

struct SHButton_Previews: PreviewProvider {
    static var previews: some View {
        SHButton(
            label: "ORDER PIZZA",
            iconName: "cart.fill",
            action: {}
        ).environmentObject(Theme())
    }
}

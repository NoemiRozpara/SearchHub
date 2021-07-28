//
//  LabelWithIcon.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import SwiftUI

struct LabelWithIcon: View {
    @EnvironmentObject var theme: Theme
    
    let text: String
    let iconName: String
    
    init(
        text: String,
        iconName: String
    ) {
        self.text = text
        self.iconName = iconName
    }
    
    var body: some View {
        HStack {
            Icon(name: iconName)
            Text(text)
                .font(.caption)
                .foregroundColor(theme.colorPalette.secondaryText)
        }
    }
}

struct LabelWithIcon_Previews: PreviewProvider {
    static var previews: some View {
        let theme = Theme()
        
        LabelWithIcon(
            text: "Lasagna is the best",
            iconName: "heart.fill"
        )
        .background(
            theme.colorPalette.background
        )
        .environmentObject(theme)
    }
}

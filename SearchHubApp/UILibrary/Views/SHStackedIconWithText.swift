//
//  SHStackedIconWithText.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 1/8/21.
//

import SwiftUI

struct SHStackedIconWithText: View {
    let label: String
    let iconName: String
    let color: Color?
    
    init(
        label: String,
        iconName: String,
        color: Color? = nil
    ) {
        self.label = label
        self.iconName = iconName
        self.color = color
    }
    
    var body: some View {
        VStack {
            SHIcon(name: iconName, size: 30, customColor: color)
            Spacer()
                .frame(height: 20)
            Text(label)
                .font(.caption)
                .multilineTextAlignment(.center)
        }
        
    }
}

struct SHStackedIconWithText_Previews: PreviewProvider {
    static var previews: some View {
        SHStackedIconWithText(
            label: "Est eveniet modi qui omnis nostrum. Facere nobis aspernatur recusandae qui sint accusantium sit quos.",
            iconName: "sparkles",
            color: .pink
        )
    }
}

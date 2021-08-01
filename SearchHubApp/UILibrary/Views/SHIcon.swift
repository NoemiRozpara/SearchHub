//
//  Icon.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import SwiftUI


struct SHIcon: View {
    @EnvironmentObject var theme: Theme
    
    let name: String
    let size: CGFloat
    let customColor: Color?
    
    init(
        name: String,
        size: CGFloat = 14,
        customColor: Color? = nil
    ) {
        self.name = name
        self.size = size
        self.customColor = customColor
    }
    
    var body: some View {
        Image(systemName: name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size, alignment: .center)
            .foregroundColor(customColor ?? theme.colorPalette.accent)
    }
}

struct Icon_Previews: PreviewProvider {
    static var previews: some View {
        SHIcon(name: "star.fill").environmentObject(Theme())
    }
}

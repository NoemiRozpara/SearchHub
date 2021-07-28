//
//  Icon.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import SwiftUI


struct Icon: View {
    @EnvironmentObject var theme: Theme
    
    let name: String
    let size: CGFloat
    
    init(
        name: String,
        size: CGFloat = 14
    ) {
        self.name = name
        self.size = size
    }
    
    var body: some View {
        Image(systemName: name)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size, height: size, alignment: .center)
            .foregroundColor(theme.colorPalette.accent)
    }
}

struct Icon_Previews: PreviewProvider {
    static var previews: some View {
        Icon(name: "lightbulb.fill").environmentObject(Theme())
    }
}

//
//  Logo.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import SwiftUI

struct SHLogo: View {
    @EnvironmentObject var theme: Theme
    
    var body: some View {
        Text("SearchHub")
            .font(.system(size: 30))
            .bold()
            .foregroundColor(theme.colorPalette.accent)
            .padding()
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        SHLogo().environmentObject(Theme())
    }
}

//
//  Logo.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import SwiftUI

struct Logo: View {
    @EnvironmentObject var theme: Theme
    
    var body: some View {
        Text("SearchHub")
            .font(.headline)
            .foregroundColor(theme.colorPalette.accent)
    }
}

struct Logo_Previews: PreviewProvider {
    static var previews: some View {
        Logo().environmentObject(Theme())
    }
}

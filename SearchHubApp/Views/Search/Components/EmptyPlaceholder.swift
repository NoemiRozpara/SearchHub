//
//  EmptyPlaceholder.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 1/8/21.
//

import SwiftUI

struct EmptyPlaceholder: View {
    var body: some View {
        VStack {
            SHIcon(name: "eyes", size: 50)
            Text("Search for some great repository, try \"Swift\"!")
        }
        
    }
}

struct EmptyPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        EmptyPlaceholder().environmentObject(Theme())
    }
}

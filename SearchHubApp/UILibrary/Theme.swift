//
//  Theme.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import SwiftUI

public class Theme: ObservableObject {
    @Published public var colorPalette: ColorPalette
    
    public struct ColorPalette {
        public private(set) var primaryText: Color
        public private(set) var secondaryText: Color
        
        public private(set) var background: Color
        public private(set) var accent: Color
        
        public init(
            primaryText: Color = Color(hex: "fff"),
            secondaryText: Color = Color(hex: "fff"),
            background: Color = Color(hex: "26547c"),
            accent: Color = Color(hex: "06d6a0")
        ) {
            self.primaryText = primaryText
            self.secondaryText = secondaryText
            self.background = background
            self.accent = accent
        }
    }
    
    public init(colorPalette: ColorPalette = ColorPalette()) {
        self.colorPalette = colorPalette
    }
}

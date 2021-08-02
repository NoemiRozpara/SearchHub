//
//  EnvironmentValues+ImageCache.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 2/8/21.
//

import Foundation
import SwiftUI

extension EnvironmentValues {
    var imageCache: ImageCacheProtocol {
        get { self[ImageCacheKey.self] }
        set { self[ImageCacheKey.self] = newValue }
    }
}

//
//  ImageCacheKey.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 2/8/21.
//

import Foundation
import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCacheProtocol = TemporaryImageCache()
}

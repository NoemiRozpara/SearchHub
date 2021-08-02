//
//  ImageCacheRepository.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 2/8/21.
//

import Foundation
import UIKit

struct TemporaryImageCache: ImageCacheProtocol {
    private let cache = NSCache<NSURL, UIImage>()
    
    subscript(_ key: URL) -> UIImage? {
        get { cache.object(forKey: key as NSURL) }
        set {
            newValue == nil
                ? cache.removeObject(forKey: key as NSURL)
                : cache.setObject(newValue!, forKey: key as NSURL)
        }
    }
}

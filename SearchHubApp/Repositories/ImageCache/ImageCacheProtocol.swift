//
//  ImageCacheProtocol.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 2/8/21.
//

import Foundation
import UIKit

protocol ImageCacheProtocol {
    subscript(_ url: URL) -> UIImage? { get set }
}

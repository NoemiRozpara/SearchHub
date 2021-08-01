//
//  URLImage.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 30/7/21.
//

import SwiftUI

struct SHURLImage: View {
    @ObservedObject var imageLoader: ImageLoader
    
    @State var image: UIImage = UIImage()
    
    private let fallbackImageName: String?
    
    init(
        _ url: URL?,
        fallbackImageName: String? = nil
    ) {
        self.fallbackImageName = fallbackImageName
        imageLoader = ImageLoader(url: url)
        if url == nil {
            self.image = getFallbackImage(fallbackImageName)
        }
    }
    
    var body: some View {
        
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onReceive(imageLoader.didChange) { data in
                if let fetchedImage = UIImage(data: data) {
                    self.image = fetchedImage
                } else {
                    self.image = getFallbackImage(fallbackImageName)
                }
            }
    }
    
    private func getFallbackImage(_ systemName: String?) -> UIImage {
        if let fallbackImage = UIImage(systemName: systemName ?? "") {
            return fallbackImage
        } else {
            return UIImage()
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        SHURLImage(URL(string: "https://www.pngkit.com/png/detail/911-9115516_avatar-icon-deadpool.png")!)
    }
}

//
//  NAAsyncImageView.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 2/8/21.
//

import SwiftUI
import Combine

struct SHAsyncImage<Placeholder: View>: View {
    @StateObject private var loader: ImageLoader
    
    private let placeholder: Placeholder
    
    private let image: (UIImage) -> Image
    
    init(
        url: URL,
        @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:),
        @ViewBuilder placeholder: () -> Placeholder
    ) {
        self.image = image
        self.placeholder = placeholder()
        _loader = StateObject(
            wrappedValue: ImageLoader(
                url: url,
                cache: Environment(\.imageCache).wrappedValue
            )
        )
    }
    
    var body: some View {
        content
            .onAppear(perform: {
                loader.load()
            })
    }
    
    private var content: some View {
        Group {
            if loader.image != nil {
                image(loader.image!)
            } else {
                placeholder
            }
        }
    }
}

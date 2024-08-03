//
//  CustomAsyncImage.swift
//  SampleSwiftUIiOSApp
//
//  Created by Arshad Khan on 8/3/24.
//

import SwiftUI

struct CustomAsyncImage: View {
    @State private var image: UIImage?
    @State private var isLoading = false
    let url: URL?
    
    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit() .onAppear {
                }
        } else if isLoading {
            ProgressView().onAppear {
            }
        } else {
            Color.gray.onAppear {
                loadImage()
            }
        }
    }
    
    private func loadImage() {
        guard let url = url else { return }
        
        if let cachedImage = ImageCache.shared.getImage(for: url) {
            self.image = cachedImage
            return
        }
        
        isLoading = true
        Task {
            let fetchedImage = await ImageCache.shared.setImage(for: url)
            DispatchQueue.main.async {
                self.isLoading = false
                self.image = fetchedImage
            }
        }
    }
}

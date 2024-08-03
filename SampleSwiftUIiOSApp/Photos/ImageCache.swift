//
//  ImageCache.swift
//  SampleSwiftUIiOSApp
//
//  Created by Arshad Khan on 8/3/24.
//

import SwiftUI

class ImageCache {
    static let shared = ImageCache()
    private init() {}
    var cache = NSCache<NSURL, UIImage>()
    
    func getImage(for url: URL) -> UIImage? {
        cache.object(forKey: url as NSURL)
    }
    
    func setImage(for url: URL) async -> UIImage? {
        let request = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse, 
                  httpResponse.statusCode == 200,
                  let image = UIImage(data: data) else { return nil }
            cache.setObject(image, forKey: url as NSURL)
            return image
        } catch {
            return nil
        }
    }
}


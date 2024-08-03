//
//  PhotosService.swift
//  SampleSwiftUIiOSApp
//
//  Created by Arshad Khan on 8/1/24.
//

import Combine
import Foundation

protocol PhotosServiceProtocol {
    func getPhotos() -> AnyPublisher<[PhotoModel], Error>
    func getPhotos() async throws -> [PhotoModel]
}

class PhotosService: PhotosServiceProtocol {
    var networkHandler: NetworkHandlerProvider
    init(networkHandler: NetworkHandlerProvider) {
        self.networkHandler = networkHandler
    }
    
    func getPhotos() -> AnyPublisher<[PhotoModel], Error> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            return Fail(error: NetworkError.invalidResponse)
                .eraseToAnyPublisher()
        }
        let request  = URLRequest(url: url)
        return networkHandler.sendRequest(request).decode(type: [PhotoModel].self, decoder: JSONDecoder()).eraseToAnyPublisher()
    }
    
    func getPhotos() async throws -> [PhotoModel] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {
            throw NetworkError.invalidResponse
        }
        
        let request = URLRequest(url: url)
        let data = try await networkHandler.sendRequest(request)
        let photos = try JSONDecoder().decode([PhotoModel].self, from: data)
        return photos
    }
}

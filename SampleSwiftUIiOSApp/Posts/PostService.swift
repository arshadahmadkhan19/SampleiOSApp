//
//  PostService.swift
//  SampleSwiftUIiOSApp
//
//  Created by Arshad Khan on 7/30/24.
//

import Combine
import Foundation

protocol PostServiceable {
    func getPostsList() -> AnyPublisher<[PostsModel], Error>
    func getPostsList() async throws -> [PostsModel]
}

class PostService: PostServiceable {
    private let networkHandler: NetworkHandlerProvider
    
    init(networkHandler: NetworkHandlerProvider) {
        self.networkHandler = networkHandler
    }
    
    func getPostsList() -> AnyPublisher<[PostsModel], Error> {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return Fail(error: NetworkError.invalidResponse)
                .eraseToAnyPublisher()
        }
        let request = URLRequest(url: url)
        return networkHandler.sendRequest(request)
            .decode(type: [PostsModel].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
     
    }
    
    func getPostsList() async throws -> [PostsModel] {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            throw NetworkError.invalidResponse
        }
        
        let request = URLRequest(url: url)
        let data = try await networkHandler.sendRequest(request)
        let posts = try JSONDecoder().decode([PostsModel].self, from: data)
        return posts
    }
}

//
//  PostViewModel.swift
//  SampleSwiftUIiOSApp
//
//  Created by Arshad Khan on 7/30/24.
//

import Combine
import Foundation

protocol PostViewModelProtocol {
    func getPosts()
    func getPosts() async
}

class PostViewModel: ObservableObject, PostViewModelProtocol {
    @Published var postsList: [PostsModel] = []
    
    private var cancellables = Set<AnyCancellable>()
    let service: PostServiceable
    
    init(service: PostServiceable) {
        self.service = service
    }
    
    func getPosts() {
        service.getPostsList()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error)
                }
            } receiveValue: { [weak self] posts  in
                self?.postsList = posts
            }.store(in: &cancellables)
    }
    
    func getPosts() async {
        do {
            let posts = try await service.getPostsList()
            DispatchQueue.main.async {
                self.postsList = posts
            }
        } catch {
            print(error)
        }
    }
}

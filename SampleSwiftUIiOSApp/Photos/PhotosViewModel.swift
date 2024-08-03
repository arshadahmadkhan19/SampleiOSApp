//
//  PhotosViewModel.swift
//  SampleSwiftUIiOSApp
//
//  Created by Arshad Khan on 8/1/24.
//

import Combine
import Foundation

protocol PhotosViewModelProtocol {
    func getPhotos()
    func getPhotos() async
}

class PhotosViewModel: ObservableObject, PhotosViewModelProtocol {
    @Published var photosList: [PhotoModel] = []
    private var cancellables = Set<AnyCancellable>()
    private let service: PhotosServiceProtocol
    
    init(photosService: PhotosServiceProtocol) {
        self.service = photosService
    }
    
    func getPhotos() {
        service.getPhotos()
            .receive(on: DispatchQueue.main).sink { completion in
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print(error)
                }
            } receiveValue: { [weak self] photos in
                self?.photosList = photos
            }.store(in: &cancellables)
    }
    
    func getPhotos() async {
        do {
            let photos = try await service.getPhotos()
            DispatchQueue.main.async {
                self.photosList = photos
            }
        } catch {
            print(error)
        }
        
    }
}

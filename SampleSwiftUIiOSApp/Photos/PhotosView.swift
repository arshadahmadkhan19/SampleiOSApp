//
//  PhotosView.swift
//  SampleSwiftUIiOSApp
//
//  Created by Arshad Khan on 8/1/24.
//

import SwiftUI

struct PhotosView: View {
    @StateObject var viewModel: PhotosViewModel

    init(service: PhotosServiceProtocol = PhotosService(networkHandler: NetworkHandler())) {
        _viewModel = StateObject(wrappedValue: PhotosViewModel(photosService: service))
    }
    var body: some View {
        List {
            ForEach(viewModel.photosList, id: \.id) { photo in
                PhotoCell(photo: photo)
            }
        }.onAppear() {
            viewModel.getPhotos()
        }
    }
}

//#Preview {
//    PhotosView()
//}

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
        NavigationStack {
            List {
                ForEach(viewModel.photosList, id: \.id) { photo in
                    NavigationLink(destination: PhotoDetailsView(photoModel: photo)) {
                        PhotoCell(photo: photo)
                    }
                }
            }.onAppear() {
                viewModel.getPhotos()
            }.listRowSeparator(.visible)
        }
    }
}

//#Preview {
//    PhotosView()
//}

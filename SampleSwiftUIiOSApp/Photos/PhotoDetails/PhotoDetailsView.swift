//
//  PhotoDetailsView.swift
//  SampleSwiftUIiOSApp
//
//  Created by Arshad Khan on 8/3/24.
//

import SwiftUI

struct PhotoDetailsView: View {
    let photoModel: PhotoModel
    
    var body: some View {
        VStack {
            Spacer()
            Text(photoModel.title ?? "").bold()
            Text("Albumd ID: \(photoModel.albumId)")
            Spacer()
            CustomAsyncImage(url: URL(string: photoModel.url ?? ""))
            Spacer()
        }.navigationTitle("Photo Details")
    }
}

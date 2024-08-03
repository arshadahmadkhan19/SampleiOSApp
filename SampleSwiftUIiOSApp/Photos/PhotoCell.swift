//
//  PhotoCell.swift
//  SampleSwiftUIiOSApp
//
//  Created by Arshad Khan on 8/2/24.
//

import SwiftUI

struct PhotoCell: View {
    let photo: PhotoModel
    
    var body: some View {
        HStack {
//            AsyncImage(url: URL(string: photo.thumbnailUrl ?? "")) { phase in
//                switch phase {
//                    case .empty:
//                        ProgressView().frame(width: 30, height: 30)
//                    case .success(let image):
//                        image.resizable()
//                            .scaledToFit()
//                            .frame(width: 30, height: 30)
//                    case .failure(let error):
//                        Image(systemName: "photo").resizable()
//                            .scaledToFit()
//                            .frame(width: 30, height: 30)
//                    @unknown default:
//                        EmptyView()
//                }
//                
//            }
//            
            CustomAsyncImage(url: URL(string: photo.thumbnailUrl ?? ""))
                           .frame(width: 30, height: 30)
                           .cornerRadius(5)
            Spacer()
            VStack(alignment: .trailing) {
                Text("Photo ID: \(photo.id)")
                Text("Album ID: \(photo.albumId)")
            }
            .padding(.leading, 8)
        }
        .padding(.vertical, 4)
        .listRowSeparator(.visible)
    }
}


//#Preview {
//    PhotoCell(photo: PhotoModel(albumId: 1, id: 2, title: "", url: "", thumbnailUrl: ""))
//}

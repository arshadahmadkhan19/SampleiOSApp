//
//  ContentView.swift
//  SampleSwiftUIiOSApp
//
//  Created by Arshad Khan on 7/30/24.
//

import SwiftUI

//struct PostsView: View {
//    @StateObject var viewModel: PostViewModel
//    
//    init(service: PostServiceable = PostService(networkHandler: NetworkHandler())) {
//        _viewModel = StateObject(wrappedValue: PostViewModel(service: service))
//    }
//
//    var body: some View {
//        List {
//            ForEach(viewModel.postsList, id: \.id) { post in
//                PostCellView(post: post)
//            }
//        }.onAppear {
//            viewModel.getPosts()
//        }
//    }
//}

struct PostsView: View {
    @StateObject var viewModel: PostViewModel
    
    init(service: PostServiceable = PostService(networkHandler: NetworkHandler())) {
        _viewModel = StateObject(wrappedValue: PostViewModel(service: service))
    }

    var body: some View {
        List {
            ForEach(viewModel.postsList, id: \.id) { post in
                PostCellView(post: post)
            }
        }.onAppear {
            Task {
                await viewModel.getPosts()
            }
        }
    }
}

#Preview {
    PostsView()
}

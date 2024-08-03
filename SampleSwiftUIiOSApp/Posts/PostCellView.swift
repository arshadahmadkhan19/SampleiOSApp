//
//  PostCellView.swift
//  SampleSwiftUIiOSApp
//
//  Created by Arshad Khan on 8/1/24.
//

import SwiftUI

struct PostCellView: View {
    let post: PostsModel
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(post.title ?? "")
                .bold()
            
            Text(post.body ?? "")
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    PostCellView(post: PostsModel(userId: 1, id: 2, title: "sample title", body: "body"))
}

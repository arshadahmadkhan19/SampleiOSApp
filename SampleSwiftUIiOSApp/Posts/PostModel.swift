//
//  PostModel.swift
//  SampleSwiftUIiOSApp
//
//  Created by Arshad Khan on 7/30/24.
//

import Foundation

struct PostsModel: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title:  String?
    let body: String?
}

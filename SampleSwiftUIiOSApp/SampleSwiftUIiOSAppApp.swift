//
//  SampleSwiftUIiOSAppApp.swift
//  SampleSwiftUIiOSApp
//
//  Created by Arshad Khan on 7/30/24.
//

import SwiftUI

@main
struct SampleSwiftUIiOSAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                PostsView()
                    .tabItem {
                        Label("Posts", systemImage: "list.bullet")
                    }
                
                PhotosView().tabItem {
                    Label("Photos", systemImage: "photo.on.rectangle")
                }
            }
        }
    }
}

//
//  MainTabView.swift
//  Brienz
//
//  Created by stat on 5/13/24.
//

import Foundation
import SwiftUI
import BRGallery

struct MainTabView: View {
    
    var body: some View {
        TabView {
            BRGalleryView()
                .tabItem {
                    Label("Gallery", systemImage: "photo.fill")
                }
        }
    }
}

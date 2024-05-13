//
//  HomeView.swift
//  BRGalleryView
//
//  Created by stat on 5/13/24.
//

import Foundation
import SwiftUI
import BRFoundation
import DataLogging

struct BRGalleryViewItem: Identifiable {
    
    var id: String = UUID().uuidString
    
    var children: [BRGalleryCellItem]
    
    static var random: Self {
        BRGalleryViewItem(children: (1...100).map { _ in BRGalleryCellItem.random })
    }
}

public struct BRGalleryView: View, DataLoggingEvent {
    
    public var eventName: Name {
        return "view"
    }
    
    public var eventOption: Option {
        return .analytics
    }
    
    public var eventParameter: Parameter? {
        return ["id": item.id]
    }
    
    let item: BRGalleryViewItem = .random
    
    public init() {}
    
    public var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVStack(spacing: .zero) {
                    ForEach(item.children) { child in
                        BRGalleryCell(item: child)
                            .frame(height: geometry.size.height / geometry.size.width * CGFloat(child.width))
                    }
                }
            }
            .background(BRDSColor.background)
            .frame(maxWidth: .infinity)
        }
        .id(item.id)
        .onAppear {
            DataLoggingCenter.sendEvent(self)
        }
    }
}

struct BRGalleryCellItem: Identifiable {
    
    var id: String = UUID().uuidString
    
    var url: String
    
    var width: Int
    
    var height: Int
    
    static var random: Self {
        let randomWidth = Int.random(in: 200...300)
        let randomHeight = Int.random(in: 200...300)
        return Self(
            url: "https://picsum.photos/\(randomWidth)/\(randomHeight)",
            width: randomWidth,
            height: randomHeight
        )
    }
}

struct BRGalleryCell: View {
    
    let item: BRGalleryCellItem
    
    var body: some View {
        AsyncImage(url: URL(string: item.url)) { image in
            image.resizable()
        } placeholder: {
            Color.random
        }
    }
}

extension Color {
    static var random: Color {
        Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}

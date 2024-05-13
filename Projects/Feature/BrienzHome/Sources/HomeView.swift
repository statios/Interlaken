//
//  HomeView.swift
//  BrienzHome
//
//  Created by stat on 5/13/24.
//

import Foundation
import SwiftUI

public struct HomeView: View {
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            VStack {
                Text("Hello, World!")
            }
            .navigationBarTitle("Home")
        }
    }
}

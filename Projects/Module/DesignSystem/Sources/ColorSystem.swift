//
//  Color.swift
//  DesignSystem
//
//  Created by stat on 5/13/24.
//

import Foundation
import UIKit
import SwiftUI

public protocol ColorSystem {
    
    static var background: Color { get }
    
    static var label: Color { get }
}

public extension Color {
    
    init(hex: String, darkHex: String? = nil) {
        self = Color(
            uiColor: UIColor { traitCollection in
                if traitCollection.userInterfaceStyle == .dark, let darkHex {
                    return UIColor(hex: darkHex)
                }
                return UIColor(hex: hex)
            }
        )
    }
}

extension UIColor {
    
    convenience init(hex: String) {
        
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        
        var int: UInt64 = 0
        
        Scanner(string: hex).scanHexInt64(&int)
        
        let a, r, g, b: UInt64
        
        switch hex.count {
        case 3:
            (r, g, b) = (int >> 8 * 2 & 0xff, int >> 8 & 0xff, int & 0xff)
            a = 255
        case 6:
            (r, g, b) = (int >> 8 * 2, int >> 8, int)
            a = 255
        case 8:
            (a, r, g, b) = (int >> 8 * 3, int >> 8 * 2, int >> 8, int)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}


//
//  HRDSColor.swift
//  HRFoundation
//
//  Created by stat on 5/13/24.
//

import SwiftUI
import DesignSystem

public struct HRDSColor: ColorSystem {
    
    public static var background: Color {
        return Color(hex: "#ffffff", darkHex: "#000000")
    }
    
    public static var label: Color {
        return Color(hex: "#000000", darkHex: "#ffffff")
    }
}


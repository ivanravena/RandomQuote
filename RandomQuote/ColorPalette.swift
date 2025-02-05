//
//  ColorPalette.swift
//  RandomQuote
//
//  Created by Ivan Ravena Pinheiro Ribeiro on 04/02/25.
//

import SwiftUI

extension UIColor {
    static let primary = UIColor(red: 234/255, green: 134/255, blue: 46/255, alpha: 1.0)  // #EA862E
    static let dark = UIColor(red: 59/255, green: 58/255, blue: 52/255, alpha: 1.0)       // #3B3A34
    static let surface = UIColor(red: 87/255, green: 85/255, blue: 78/255, alpha: 1.0)    // #57554E
    static let light = UIColor(red: 211/255, green: 210/255, blue: 203/255, alpha: 1.0)   // #D3D2CB
}

extension Color {
    static let primary = Color(UIColor.primary)
    static let dark = Color(UIColor.dark)
    static let surface = Color(UIColor.surface)
    static let light = Color(UIColor.light)
}

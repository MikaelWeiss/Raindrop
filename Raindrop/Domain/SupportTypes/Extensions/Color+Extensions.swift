//
//  Color+Extensions.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/19/20.
//

import SwiftUI

extension Color {
    public static var darkPurpleTextColor = Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))
    public static var standardCellFontColor = Color(#colorLiteral(red: 0.5411272645, green: 0.5412079692, blue: 0.5411095023, alpha: 1))
    public static var standardCellValueFontColor = Color(#colorLiteral(red: 0.2500658035, green: 0.4984801412, blue: 0.65720433, alpha: 1))
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

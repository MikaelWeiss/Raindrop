//
//  Color+Extensions.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/19/20.
//

import SwiftUI

extension Color {
    public static var darkPurpleTextColor = Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1))
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

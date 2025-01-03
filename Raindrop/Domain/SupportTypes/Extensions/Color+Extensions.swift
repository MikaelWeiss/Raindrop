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
    public static var entryItemValueColor = Color("entryItemValueColor")
    public static var cellOutlineColor = Color("cellOutlineColor")
    public static var treeGreen = Color(#colorLiteral(red: 0.1490196078, green: 0.3607843137, blue: 0.003921568627, alpha: 1))
    public static var deepBlue = Color(#colorLiteral(red: 0.003921568627, green: 0.2470588235, blue: 0.5058823529, alpha: 1))
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

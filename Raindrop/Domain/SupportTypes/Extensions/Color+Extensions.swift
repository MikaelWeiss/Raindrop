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
    public static var standardCellValueFontColor = Color(#colorLiteral(red: 0.2500658035, green: 0.4984801412, blue: 0.65720433, alpha: 1))
    public static var tintColor = Color(#colorLiteral(red: 0.2500658035, green: 0.4984801412, blue: 0.65720433, alpha: 1))
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

extension Color {
    func uiColor() -> UIColor {
        if #available(iOS 14.0, *) {
            return UIColor(self)
        }

        let scanner = Scanner(string: description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0

        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xFF000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00FF0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000FF00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000FF) / 255
        }
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}

extension Color {
    static var appColors: [Color] = [.tintColor, .deepBlue, .treeGreen, .darkPurpleTextColor, .green, .orange, .red]
}

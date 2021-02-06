//
//  FontStyle.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/4/20.
//

import SwiftUI

struct FontStyle: ViewModifier {
    let tintColor: Color
    func body(content: Content) -> some View {
        content
            .font(Styles.standardFontStyle)
            .foregroundColor(tintColor)
    }
}

struct ValueFontStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Styles.standardValueFontStyle)
            .foregroundColor(.entryItemValueColor)
    }
}

extension View {
    func fontStyle(_ tintColor: Color = .standardCellFontColor) -> some View {
        self.modifier(FontStyle(tintColor: tintColor))
    }
    
    func valueFontStyle() -> some View {
        self.modifier(ValueFontStyle())
    }
}

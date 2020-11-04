//
//  FontStyle.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/4/20.
//

import SwiftUI

struct FontStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Styles.standardFontStyle)
    }
}

extension View {
    func fontStyle() -> some View {
        self.modifier(FontStyle())
    }
}

//
//  CellStyle.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/4/20.
//

import SwiftUI

struct CellStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 56, alignment: .center)
            .frame(maxWidth: 400)
            .padding(.horizontal, 16)
    }
}

extension View {
    func cellStyle() -> some View {
        self.modifier(CellStyle())
    }
}

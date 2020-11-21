//
//  CellStyle.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/4/20.
//

import SwiftUI

struct CellStyle: ViewModifier {
    func body(content: Content) -> some View {
        VStack {
            content
                .padding()
            Color(#colorLiteral(red: 0.2195718288, green: 0.2195555866, blue: 0.2281640768, alpha: 1))
                .frame(height: 1)
                .padding(.leading)
        }
        .fontStyle()
    }
}

extension View {
    func cellStyle() -> some View {
        self.modifier(CellStyle())
    }
}

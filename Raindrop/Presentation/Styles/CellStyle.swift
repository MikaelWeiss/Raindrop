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
                .overlay (
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .stroke(Color.standardCellValueFontColor, lineWidth: 1.5)
                )
                .padding([.horizontal, .top])
        }
        .fontStyle()
    }
}

extension View {
    func cellStyle() -> some View {
        self.modifier(CellStyle())
    }
}

// MARK: - Previews

struct CellStyle_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("Sup")
                .cellStyle()
        }.colorScheme(.dark)
    }
}

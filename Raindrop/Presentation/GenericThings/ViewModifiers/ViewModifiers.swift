//
//  ViewModifiers.swift
//  Raindrop
//
//  Created by Mikael Weiss on 2/4/21.
//

import SwiftUI

struct PreviewKind: ViewModifier {
    func body(content: Content) -> some View {
        Group {
            content
            content
                .background(Color(.systemBackground))
                .colorScheme(.dark)
        }.previewLayout(.sizeThatFits)
    }
}

extension View {
    func makePreviewKind() -> some View {
        self.modifier(PreviewKind())
    }
}

struct CardSheet: ViewModifier {
    let cardHeight: CGFloat
    func body(content: Content) -> some View {
        content
            .frame(height: cardHeight)
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                    .foregroundColor(Color(.systemBackground))
            )
            .shadow(radius: 10)
            .offset(y: 25)
    }
}

extension View {
    func makeCardSheet(cardHeight: CGFloat = 200) -> some View {
        self.modifier(CardSheet(cardHeight: cardHeight))
    }
}

//
//  ViewModifiers.swift
//  Raindrop
//
//  Created by Mikael Weiss on 2/4/21.
//

import SwiftUI

extension View {
    func makePreviewKind(previewLayout: PreviewLayout = .sizeThatFits) -> some View {
        Group {
            self
            self
                .background(Color(.systemBackground))
                .colorScheme(.dark)
        }
            .previewLayout(previewLayout)
    }
}

struct CardSheet: ViewModifier {
    let cardHeight: CGFloat
    let color = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    
    func body(content: Content) -> some View {
        ZStack {
            Color(.secondarySystemFill)
                .opacity(0.8)
                .onTapGesture {
                    ViewCoordinator.shared.currentView = nil
                }
            VStack {
                Spacer()
                VStack {
                    content
                    Spacer().frame(height: 36)
                }
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 25.0, style: .continuous)
                            .foregroundColor(Color(.secondarySystemBackground))
                    )
                .shadow(radius: 10)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CardSheet_Preview: PreviewProvider {
    static var previews: some View {
        Text("Sup")
            .makeCardSheet()
            .makePreviewKind(previewLayout: .device)
            .edgesIgnoringSafeArea(.all)
    }
}

extension View {
    func makeCardSheet(cardHeight: CGFloat = 200) -> some View {
        self.modifier(CardSheet(cardHeight: cardHeight))
    }
}

//
//  WrapInNavigationView.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/6/20.
//

import SwiftUI

struct NavigationViewWrapper: ViewModifier {
    func body(content: Content) -> some View {
        NavigationView {
            content
                .navigationBarHidden(true)
        }
    }
}

extension View {
    func wrapInNavigationView() -> some View {
        self.modifier(NavigationViewWrapper())
    }
}

struct NavigationLinkWrapper<Destination>: ViewModifier where Destination : View {
    let destination: () -> Destination
    let isActive: Binding<Bool>
    
    func body(content: Content) -> some View {
        NavigationLink(
            destination: destination(),
            isActive: isActive,
            label: { content })
            .buttonStyle(PlainButtonStyle())
    }
}

extension View {
    func wrapInNavigationLink<Destination : View>(isActive: Binding<Bool>, destination: @escaping () -> Destination) -> some View {
        self.modifier(NavigationLinkWrapper(destination: destination, isActive: isActive))
    }
}

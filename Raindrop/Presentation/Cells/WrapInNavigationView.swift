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
    let destination: Destination
    func body(content: Content) -> some View {
        NavigationLink(
            destination: destination,
            label: { content })
            .buttonStyle(PlainButtonStyle())
    }
}

extension View {
    func wrapInNavigationLink<Destination : View>(destination: Destination) -> some View {
        self.modifier(NavigationLinkWrapper(destination: destination))
    }
}

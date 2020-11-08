//
//  WrapInNavigationLink.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/8/20.
//

import SwiftUI

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

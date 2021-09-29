//
//  WrapInNavigationLink.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/8/20.
//

import SwiftUI

extension View {
    func wrapInNavigationLink<Destination : View>(isActive: Binding<Bool>, destination: @escaping () -> Destination) -> some View {
        NavigationLink(
            destination: destination(),
            isActive: isActive,
            label: { self })
            .buttonStyle(PlainButtonStyle())
    }
}

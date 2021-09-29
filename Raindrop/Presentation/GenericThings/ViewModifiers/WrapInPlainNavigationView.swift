//
//  WrapInNavigationView.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/6/20.
//

import SwiftUI

struct PlainNavigationViewWrapper: ViewModifier {
    func body(content: Content) -> some View {
        
    }
}

extension View {
    func wrapInPlainNavigationView() -> some View {
        NavigationView {
            self
                .navigationBarHidden(true)
        }
    }
}

//
//  StandardButton.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/8/20.
//

import SwiftUI

struct StandardButton: View {
    @Environment(\.colorScheme) var colorScheme
    
    let title: String
    let onTap: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .frame(height: 56, alignment: .center)
            .foregroundColor(.deepBlue)
            .overlay (
                Text(title)
                    .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                    .fontStyle()
            )
            .padding()
            .onTapGesture {
                onTap()
            }
    }
}

struct StandardButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StandardButton(title: "Some title", onTap: { })
                .colorScheme(.light)
            StandardButton(title: "Some title", onTap: { })
                .background(Color(.systemBackground))
                .colorScheme(.dark)
        }.previewLayout(.sizeThatFits)
    }
}

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
            .foregroundColor(.blue)
            .overlay (
                Text(title)
                    .foregroundColor(colorScheme == .dark ? Color.darkPurpleTextColor : Color.white)
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
            VStack {
                StandardButton(title: "Some title", onTap: { })
            }.colorScheme(.light)
            ZStack {
                Color.black
                VStack {
                    StandardButton(title: "Some title", onTap: { })
                }
            }.colorScheme(.dark)
        }.previewLayout(.sizeThatFits)
    }
}

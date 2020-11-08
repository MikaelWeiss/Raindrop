//
//  StandardButton.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/8/20.
//

import SwiftUI

struct StandardButton: View {
    let title: String
    let onTap: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .cellStyle()
            .foregroundColor(.blue)
            .overlay (
                Text(title).fontStyle()
            )
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

//
//  ColorSelector.swift
//  Raindrop
//
//  Created by Mikael Weiss on 2/4/21.
//

import SwiftUI

struct ColorSelector: View {
    let title: String
    let currentlySelectedColor: Color
    let onSelectedColor: (Color) -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .fontStyle()
            Spacer()
            Circle()
                .foregroundColor(currentlySelectedColor)
                .background(
                    Circle()
                        .frame(width: 36, height: 36)
                        .accentColor(Color(.secondarySystemBackground))
                )
                .frame(width: 26, height: 26)
                .padding(.trailing, 6)
        }
        .padding(.vertical, 6)
        .onTapGesture {
            ViewCoordinator.shared.currentView = AnyView(buildColorView())
        }
    }
    
    private func buildColorView() -> some View {
        VStack {
            Spacer()
            ColorSheet("Group Color",
                      colors: Color.appColors.map { IdentifiableColor($0) },
                      currentColor: IdentifiableColor(currentlySelectedColor)) {
                onSelectedColor($0)
            }
        }
    }
}

struct ColorSelector_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelector(title: "Group Color", currentlySelectedColor: Color.red) {_ in }
                    .makePreviewKind()
    }
}

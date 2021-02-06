//
//  ColorSelector.swift
//  Raindrop
//
//  Created by Mikael Weiss on 2/4/21.
//

import SwiftUI

struct ColorSelector: View {
    @State private var colorPickerShowing = false
    @State private var selectedColor: Color = .tintColor
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Circle()
                .foregroundColor(selectedColor)
                .background(
                    Circle()
                        .frame(width: 36, height: 36)
                        .accentColor(.secondary)
                )
                .frame(width: 26, height: 26)
                .padding(.trailing, 6)
            if colorPickerShowing {
                Color.blue
            }
        }
        .padding(.vertical)
        .onTapGesture {
            colorPickerShowing.toggle()
            if colorPickerShowing {
                ViewCoordinator.shared.currentView = AnyView(buildColorView())
            }
        }
    }
    func buildColorView() -> some View {
        VStack {
            Spacer()
            ColorView("Group Color",
                      colors: Color.appColors.map { IdentifiableColor($0) },
                      currentColor: IdentifiableColor(selectedColor)) {
                selectedColor = $0
            }
        }
    }
}

struct ColorSelector_Previews: PreviewProvider {
    static var previews: some View {
        ColorSelector(title: "Group Color")
        //            .makePreviewKind()
    }
}

//
//  ColorSheet.swift
//  Raindrop
//
//  Created by Mikael Weiss on 2/4/21.
//

import SwiftUI

struct ColorSheet: View {
    private let columns: [GridItem] = [
        GridItem(.adaptive(minimum: 40))]
    
    let title: String
    let colors: [IdentifiableColor]
    
    let currentColor: IdentifiableColor
    let onSelectedColor: (Color) -> Void
    
    init(_ title: String,
         colors: [IdentifiableColor],
         currentColor: IdentifiableColor,
         onSelectedColor: @escaping (Color) -> Void) {
        
        self.title = title
        self.colors = colors
        self.currentColor = currentColor
        self.onSelectedColor = onSelectedColor
    }
    
    var body: some View {
        let binding = Binding {
            currentColor.color
        } set: { color in
            onSelectedColor(color)
        }
        
        return VStack() {
            Text(title)
                .padding(.top)
                .fontStyle()
            Spacer()
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(colors) { color in
                    Circle().frame(width: 36, height: 36)
                        .foregroundColor(color.color)
                        .onTapGesture {
                            onSelectedColor(color.color)
                        }
                    if color.id == colors.last?.id {
                        ColorPicker("", selection: binding)
                            .scaleEffect(CGSize(width: 1.25, height: 1.25))
                            .offset(x: -7.5)
                    }
                }
            }
            .padding(.bottom, 35)
            .padding(.horizontal)
            Spacer()
        }
        .makeCardSheet()
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        var selectedColor = IdentifiableColor(.blue)
        return ColorSheet("Group Background",
                  colors: [
                    selectedColor,
                    .init(.green),
                    .init(.yellow),
                    .init(.orange),
                    .init(.red),
                    .init(.blue),
                    .init(.green),
                    .init(.yellow),
                    .init(.orange),
                    .init(.red)],
                  currentColor: selectedColor) {
            selectedColor = IdentifiableColor($0)
        }
        .makePreviewKind()
    }
}

struct IdentifiableColor: Identifiable {
    let color: Color
    let id = UUID()
    
    init(_ color: Color) {
        self.color = color
    }
}

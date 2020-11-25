//
//  Checklist.swift
//  Raindrop
//
//  Created by Mikael Weiss on 10/3/20.
//

import SwiftUI

struct Checklist: View {
    let title: String
    let value: [ChecklistItem]
    let onValueChanged: (UUID) -> Void
    
    init(_ title: String, value: [ChecklistItem], onValueChanged: @escaping (UUID) -> Void) {
        self.title = title
        self.value = value
        self.onValueChanged = onValueChanged
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            ForEach(value) { item in
                HStack(alignment: .center) {
                    Image(systemName: item.isSelected ? "square.fill" : "square")
                    Text(item.value)
                    Color(.systemBackground)
                }
                .frame(height: 20)
                .valueFontStyle()
                .onTapGesture {
                    onValueChanged(item.id)
                }
            }.valueFontStyle()
        }.cellStyle()
    }
}

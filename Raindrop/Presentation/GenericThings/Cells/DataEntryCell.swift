//
//  DataEntryCell.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/4/20.
//

import SwiftUI

struct DataEntryCell: View {
    let title: LocalizedStringKey
    let value: String
    let onEditingChanged: (Bool) -> Void
    let onCommit: () -> Void
    let onTextChanged: (String) -> Void
    
    init(title: LocalizedStringKey,
         value: String,
         onEditingChanged: @escaping (Bool) -> Void = {_ in },
         onCommit: @escaping () -> Void = {},
         onTextChanged: @escaping (String) -> Void = {_ in }) {
        self.title = title
        self.value = value
        self.onEditingChanged = onEditingChanged
        self.onCommit = onCommit
        self.onTextChanged = onTextChanged
    }
    
    var body: some View {
        let valueBinding = Binding<String>(
            get: {
                value
            }, set: {
                onTextChanged($0)
            })
        return TextField(title,
                         text: valueBinding,
                         onEditingChanged: onEditingChanged,
                         onCommit: onCommit)
        .cellStyle()
        .fontStyle()
    }
}

struct DataEntryCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VStack {
                DataEntryCell(title: "Placeholder", value: "")
                DataEntryCell(title: "Placeholder", value: "Something value")
            }.colorScheme(.light)
            ZStack {
                Color.black
                VStack {
                    DataEntryCell(title: "Placeholder", value: "")
                    DataEntryCell(title: "Placeholder", value: "Something value")
                }
            }.colorScheme(.dark)
        }.previewLayout(.sizeThatFits)
    }
}

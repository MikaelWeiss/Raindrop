//
//  NumberEntry.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/24/20.
//

import SwiftUI

struct NumberEntry: View {
    let title: String
    let value: String
    let onValueChanged: (String) -> Void
    
    init(_ title: String, value: String, onValueChanged: @escaping (String) -> Void) {
        self.title = title
        self.value = value
        self.onValueChanged = onValueChanged
    }
    
    var body: some View {
        let binding = Binding(get: { value }, set: { onValueChanged($0) })
        HStack {
            Text(title)
            Spacer()
            TextField("Enter Number", text: binding)
                .frame(width: 164)
                .multilineTextAlignment(.trailing)
                .valueFontStyle()
        }.cellStyle()
    }
}

struct NumberEntry_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NumberEntry("Some title", value: "$999,999,999", onValueChanged: {_ in })
            
            NumberEntry("Some title", value: "$999,999,999", onValueChanged: {_ in })
                .background(Color(.systemBackground))
                .colorScheme(.dark)
        }.previewLayout(.sizeThatFits)
    }
}

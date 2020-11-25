//
//  ComputedValue.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/24/20.
//

import SwiftUI

struct ComputedValue: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value).valueFontStyle()
        }.cellStyle()
    }
}

struct ComputedValue_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ComputedValue(title: "Some title", value: "Some value")
            ComputedValue(title: "Some title", value: "Some value")
                .background(Color(.systemBackground))
                .colorScheme(.dark)
        }.previewLayout(.sizeThatFits)
    }
}

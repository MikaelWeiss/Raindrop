//
//  ComputedValueItemCell.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/8/20.
//

import SwiftUI

struct ComputedValueItemCell: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(value)
        }
        .cellStyle()
        .fontStyle()
    }
}

struct ComputedValueItemCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VStack {
                ComputedValueItemCell(title: "Some title", value: "Some value")
            }.colorScheme(.light)
            ZStack {
                Color.black
                VStack {
                    ComputedValueItemCell(title: "Some title", value: "Some value")
                }
            }.colorScheme(.dark)
        }.previewLayout(.sizeThatFits)
    }
}

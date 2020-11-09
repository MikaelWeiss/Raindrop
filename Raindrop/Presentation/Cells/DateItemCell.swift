//
//  DateItemCell.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/8/20.
//

import SwiftUI

struct DateItemCell: View {
    @Binding var date: Date?
    let title: String
    
    var body: some View {
        let dateBinding = Binding(
            get: { self.date ?? Date.today },
            set: { self.date = $0 }
        )
        return DatePicker(selection: dateBinding, label: { Text(title) })
            .cellStyle()
            .fontStyle()
    }
}

struct DateItemCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            VStack {
                DateItemCell(date: .constant(nil), title: "Some title")
            }.colorScheme(.light)
            ZStack {
                Color.black
                VStack {
                    DateItemCell(date: .constant(nil), title: "Some title")
                }
            }.colorScheme(.dark)
        }.previewLayout(.sizeThatFits)
    }
}

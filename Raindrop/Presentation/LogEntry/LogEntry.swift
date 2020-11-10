//
//  LogEntry.swift
//  Raindrop
//
//  Created by Mikael Weiss on 9/30/20.
//

import SwiftUI

struct OldLogEntry: View {
    @State private var date: Date?
    @State private var description: String = ""
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                ComputedValueItemCell(title: "Log #", value: "1")
                DateItemCell(date: $date, title: "Date")
                DataEntryCell(title: "Description", value: description)
            }
        }
        .fontStyle()
    }
}

struct OldLogEntry_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.primary)
            OldLogEntry()
                .colorScheme(.dark)
        }
    }
}

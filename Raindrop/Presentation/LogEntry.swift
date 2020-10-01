//
//  LogEntry.swift
//  Raindrop
//
//  Created by Mikael Weiss on 9/30/20.
//

import SwiftUI

struct LogEntry: View {
    let items: [Item]
    var body: some View {
        VStack {
            
        }
    }
}

struct LogEntry_Previews: PreviewProvider {
    static var previews: some View {
        LogEntry(items: [Item(title: "Log", type: .computed),
                         Item(title: "Date", type: .date),
                         Item(title: "Description", type: .text),
                         Item(title: "Amount", type: .number),
                         Item(title: "Balance", type: .computed),
                         Item(title: "Category", type: .selection)])
    }
}

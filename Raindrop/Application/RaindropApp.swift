//
//  RaindropApp.swift
//  Raindrop
//
//  Created by Mikael Weiss on 9/26/20.
//

import SwiftUI

@main
struct RaindropApp: App {
    var body: some Scene {
        WindowGroup {
            LogEntry(items: [Item(title: "Log #", type: .computed(0)),
                             Item(title: "Date", type: .date(Date.now)),
                             Item(title: "Description", type: .text(nil)),
                             Item(title: "Amount", type: .number(0)),
                             Item(title: "Balance", type: .computed(0)),
                             Item(title: "Category", type: .selection(Selection(items: ["Sup"], selectedItemIndex: 0)))])
        }
    }
}

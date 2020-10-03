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
            LogEntry(items: [Item(title: "Log #"),
                             Item(title: "Date", type: .date),
                             Item(title: "Description", type: .text),
                             Item(title: "Amount", type: .number),
                             Item(title: "Balance", type: .computed),
                             Item(title: "Category", type: .selection)])
        }
    }
}

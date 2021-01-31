//
//  EntryGroup.swift
//  Raindrop
//
//  Created by Mikael Weiss on 1/15/21.
//

import SwiftUI

class EntryGroup: Identifiable, ObservableObject {
    let id = UUID()
    @Published var name: String
    @Published var groupEntryOutline: [OutlineType]
    @Published var entrys: [Entry]
    @Published var tintColor: Color = .tintColor
    
    init(name: String, groupEntryOutline: [OutlineType], entrys: [Entry]) {
        self.name = name
        self.groupEntryOutline = groupEntryOutline
        self.entrys = entrys
    }
}

struct OutlineType: Identifiable {
    let id = UUID()
    let type: OutlineInputType
}

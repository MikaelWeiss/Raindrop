//
//  EntryGroup.swift
//  Raindrop
//
//  Created by Mikael Weiss on 1/15/21.
//

import SwiftUI

struct EntryGroup: Identifiable {
    let id = UUID()
    var name: String
    var groupEntryOutline: [OutlineType]
    var entrys: [Entry]
    var tintColor: Color = .tintColor
    
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

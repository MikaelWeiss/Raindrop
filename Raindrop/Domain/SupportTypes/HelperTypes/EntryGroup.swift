//
//  EntryGroup.swift
//  Raindrop
//
//  Created by Mikael Weiss on 1/15/21.
//

import Foundation

class EntryGroup: Identifiable, ObservableObject {
    let id = UUID()
    let name: String
    let groupEntryOutline: [OutlineInputType]
    let entrys: [Entry]
    
    init(name: String, groupEntryOutline: [OutlineInputType], entrys: [Entry]) {
        self.name = name
        self.groupEntryOutline = groupEntryOutline
        self.entrys = entrys
    }
}

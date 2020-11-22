//
//  Checklist.swift
//  Raindrop
//
//  Created by Mikael Weiss on 10/3/20.
//

import Foundation

struct ChecklistItems {
    struct ChecklistItem: Identifiable {
        let id = UUID()
        let title: String
        var selected: Bool
    }
    
    var items: [ChecklistItem]
}

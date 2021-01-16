//
//  ChecklistItem.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/26/20.
//

import Foundation

struct ChecklistItem: Identifiable, UIdentifiable, Equatable {
    let id = UUID()
    var value: String
    var isSelected = false
    
    init(value: String, isSelected: Bool = false) {
        self.value = value
        self.isSelected = isSelected
    }
    
    init(value: String) {
        self.value = value
    }
}

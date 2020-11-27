//
//  ChecklistItem.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/26/20.
//

import Foundation

struct ChecklistItem: Identifiable, UIdentifiable {
    var id = UUID()
    var value: String
    var isSelected = false
}

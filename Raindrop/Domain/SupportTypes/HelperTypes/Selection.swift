//
//  Selection.swift
//  Raindrop
//
//  Created by Mikael Weiss on 10/3/20.
//

import Foundation

struct Selection: Identifiable, Equatable {
    let id = UUID()
    var items: [SelectionItem]
    var currentlySelectedItem: SelectionItem?
    
    static func == (rhs: Selection, lhs: Selection) -> Bool {
        return
            rhs.id == lhs.id &&
            rhs.items == lhs.items &&
            rhs.currentlySelectedItem == lhs.currentlySelectedItem
    }
}

struct SelectionItem: Identifiable, UIdentifiable, Equatable {
    let id = UUID()
    let title: String
}

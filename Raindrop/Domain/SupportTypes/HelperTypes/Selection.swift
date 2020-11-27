//
//  Selection.swift
//  Raindrop
//
//  Created by Mikael Weiss on 10/3/20.
//

import Foundation

struct Selection {
    struct SelectionItem: Identifiable, UIdentifiable {
        let id = UUID()
        let title: String
    }
    var items: [SelectionItem]
    var currentlySelectedItem: SelectionItem?
}

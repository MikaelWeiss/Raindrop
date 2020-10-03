//
//  Item.swift
//  Raindrop
//
//  Created by Mikael Weiss on 9/30/20.
//

import Foundation

struct Item: Identifiable {
    let id = UUID()
    let title: String
    let type: ValueType
    
    init(title: String, type: ValueType) {
        self.title = title
        self.type = type
    }
}

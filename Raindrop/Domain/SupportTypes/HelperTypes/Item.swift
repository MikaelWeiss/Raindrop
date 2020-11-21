//
//  Item.swift
//  Raindrop
//
//  Created by Mikael Weiss on 9/30/20.
//

import Foundation

struct Item<Value>: Identifiable {
    let id = UUID()
    let title: String
    let type: InputType
    let value: Value
    let onValueChanged: (Value) -> Void
    
    init(title: String, type: InputType, value: Value, onValueChanged: @escaping (Value) -> Void) {
        self.title = title
        self.type = type
        self.value = value
        self.onValueChanged = onValueChanged
    }
}


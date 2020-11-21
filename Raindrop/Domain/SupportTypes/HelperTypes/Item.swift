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
    var type: InputType
    
    init(title: String, type: InputType) {
        self.title = title
        self.type = type
    }
}

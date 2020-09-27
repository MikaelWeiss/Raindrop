//
//  TextType.swift
//  Raindrop
//
//  Created by Mikael Weiss on 9/27/20.
//

import Foundation

struct TextType: Standard {
    private(set) var id = UUID()
    private(set) var type: ValueType = .text
    private(set) var value: String?
    
    mutating func setValue(_ value: String?) {
        self.value = value
    }
}

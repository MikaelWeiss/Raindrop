//
//  NumberType.swift
//  Raindrop
//
//  Created by Mikael Weiss on 9/27/20.
//

import Foundation

struct Number: Standard {
    private(set) var id = UUID()
    private(set) var type: ValueType = .number
    private(set) var value: Decimal
    
    init(_ value: Decimal) {
        self.value = value
    }
    
    mutating func setValue(_ value: Decimal) {
        self.value = value
    }
}

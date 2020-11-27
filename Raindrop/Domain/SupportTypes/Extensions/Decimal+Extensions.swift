//
//  Decimal+Extensions.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/26/20.
//

import Foundation

extension Decimal {
    init?(fromString: String) {
        let sanitized = NumberSupport.sanitize(value: fromString)
        
        if let number = NumberFormatter().number(from: sanitized) {
            self = number.decimalValue
        } else {
            return nil
        }
    }
}

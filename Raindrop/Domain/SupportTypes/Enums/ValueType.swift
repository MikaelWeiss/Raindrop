//
//  ValueType.swift
//  Raindrop
//
//  Created by Mikael Weiss on 9/27/20.
//

import Foundation


enum ValueType {
    case text
    case timer
    case number
    case date
    case selection
    case checklist
    
    var type: Any? {
        switch self {
        case .text:
            return String.self
        case .timer:
            return Decimal.self
        case .number:
            return Decimal.self
        case .date:
            return Date.self
        default: return nil
        }
    }
}

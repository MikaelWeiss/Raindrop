//
//  InputType.swift
//  Raindrop
//
//  Created by Mikael Weiss on 9/27/20.
//

import Foundation

enum InputType {
    case text(String?)
    case timer(Int)
    case number(Decimal)
    case date(Date)
    case selection(Selection)
    case checklist(Checklist)
    case computed(Int)
}

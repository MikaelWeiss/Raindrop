//
//  InputType.swift
//  Raindrop
//
//  Created by Mikael Weiss on 9/27/20.
//

import Foundation

enum InputType {
    case text(String)
    case timer(Int)
    case number(String)
    case date(Date)
    case selection(Selection)
    case checklist([ChecklistItem])
    case computed(String)
}

//
//  Standard.swift
//  Raindrop
//
//  Created by Mikael Weiss on 9/27/20.
//

import Foundation

protocol Standard {
    var id: UUID { get }
    var type: ValueType { get }
    var title: String { get }
}

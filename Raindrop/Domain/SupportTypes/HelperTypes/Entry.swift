//
//  Entry.swift
//  Raindrop
//
//  Created by Mikael Weiss on 1/15/21.
//

import Foundation

struct Entry: Identifiable {
    let id = UUID()
    let creationDate = Date()
    private var items = [Item]()
}

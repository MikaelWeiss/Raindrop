//
//  BuildGroupService.swift
//  Raindrop
//
//  Created by Mikael Weiss on 1/23/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

protocol BuildGroupService {
    func canSave() -> Bool
    func save() throws
    func fetchGroup() throws -> EntryGroup
    func setGroupName(_ name: String)
    func setGroupColor(color: Color)
}

extension BuildGroup {
    
    enum ServiceError: Error {
        case fetchFailed
        case saveFailed
    }
    
    class Service: BuildGroupService {
        
        func canSave() -> Bool {
            true
        }
        func save() throws { }
        func fetchGroup() throws -> EntryGroup {
            EntryGroup(name: "Some Name", groupEntryOutline: [OutlineType(type: .text)], entrys: [])
        }
        
        func setGroupName(_ name: String) { }
        
        func setGroupColor(color: Color) { }
    }
}

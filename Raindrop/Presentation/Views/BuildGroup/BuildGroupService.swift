//
//  BuildGroupService.swift
//  Raindrop
//
//  Created by Mikael Weiss on 1/23/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol BuildGroupService {
    func save() throws
    func fetchGroup() throws -> EntryGroup
}

extension BuildGroup {
    
    enum ServiceError: Error {
        case fetchFailed
        case saveFailed
    }
    
    class Service: BuildGroupService {
        func save() throws {
        }
        func fetchGroup() throws -> EntryGroup {
            EntryGroup(name: "Some Name", groupEntryOutline: [OutlineType(type: .text)], entrys: [])
        }
    }
    
    class DemoService: BuildGroupService {
        func save() {
        }
        func fetchGroup() -> EntryGroup {
            EntryGroup(name: "Some Name", groupEntryOutline: [OutlineType(type: .text)], entrys: [])
        }
    }
}

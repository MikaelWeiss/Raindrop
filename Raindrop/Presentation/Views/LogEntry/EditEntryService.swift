//
//  EditEntryService.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/20/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol EditEntryService {
    func fetchItems() -> [Item]
    func validateTextFieldInput(_ input: String, id: UUID) throws -> Item
    func validateNumberInput(_ input: String, id: UUID) throws -> Item
    func validateDateInput(_ input: Date, id: UUID) throws -> Item
    func validateChecklistInput(checklistID: UUID, checklistItemID: UUID) throws -> Item
    func validateSelectionInput(selectionID: UUID, selectionItemID: UUID) throws -> Item
    func canSave() -> Bool
    func save() throws
}

extension EditEntry {
    
    enum ServiceError: Error {
        case itemNotFound
        case invalidFormat
        case wrongItemType
        case saveFailed
    }
    
    class Service: EditEntryService {
        let testItems = [Item(title: "Entry Number", type: .computed("1")),
        Item(title: "Date", type: .date(Date.now)),
        Item(title: "Text Entry", type: .text("")),
        Item(title: "Number Entry", type: .number("$999,999,999")),
        Item(title: "Checklist", type: .checklist([
                                                   ChecklistItem(value: "Item 1"),
                                                   ChecklistItem(value: "Item 2"),
                                                   ChecklistItem(value: "Item 3"),
                                                   ChecklistItem(value: "Item 4")])),
        Item(title: "Select Value", type: .selection(Selection(items: [
                                                                   .init(title: "Item 1"),
                                                                   .init(title: "Item 2"),
                                                                   .init(title: "Item 3")],
                                                               currentlySelectedItem: nil)))]
        private var entryItems: [Item] = []
        
        func fetchItems() -> [Item] {
            let items = testItems
            entryItems = items
            return items
        }
        
        func validateTextFieldInput(_ input: String, id: UUID) throws -> Item {
            var item = try findItemWith(id: id, in: entryItems)
            item.type = .text(input)
            
            try set(item, with: id)
            
            return item
        }
        
        func validateNumberInput(_ input: String, id: UUID) throws -> Item {
            var item = try findItemWith(id: id, in: entryItems)
            item.type = .number(input)
            
            try set(item, with: id)
            
            return item
        }
        
        func validateDateInput(_ input: Date, id: UUID) throws -> Item {
            var item = try findItemWith(id: id, in: entryItems)
            item.type = .date(input)
            
            try set(item, with: id)
            
            return item
        }
        
        func validateChecklistInput(checklistID: UUID, checklistItemID: UUID) throws -> Item {
            var item = try findItemWith(id: checklistID, in: entryItems)
            guard case let .checklist(list) = item.type else { throw ServiceError.wrongItemType }
            
            guard let itemIndex = list.firstIndex(where: { $0.id == checklistItemID }) else { throw ServiceError.itemNotFound }
            var temporaryList = list
            temporaryList[itemIndex].isSelected.toggle()
            
            item.type = .checklist(temporaryList)
            
            try set(item, with: checklistID)
            
            return item
        }
        
        func validateSelectionInput(selectionID: UUID, selectionItemID: UUID) throws -> Item {
            var item = try findItemWith(id: selectionID, in: entryItems)
            guard case let .selection(selection) = item.type else { throw ServiceError.wrongItemType }
            
            var tempSelection = selection
            
            let onDiskCurrentlySelectedItemId = selection.currentlySelectedItem?.id
            
            if onDiskCurrentlySelectedItemId == selectionItemID {
                tempSelection.currentlySelectedItem = nil
            } else {
                let selectionItem = try findItemWith(id: selectionItemID, in: selection.items)
                tempSelection.currentlySelectedItem = selectionItem
            }
            
            item.type = .selection(tempSelection)
            try set(item, with: selectionID)
            
            return item
        }
        
        func canSave() -> Bool {
            for item in entryItems {
                switch item.type {
                default: break
                }
            }
            return true
        }
        
        func save() throws {
            if canSave() == false {
                throw ServiceError.saveFailed
            }
            throw ServiceError.saveFailed
        }
        
        private func nonNilValue<Type>(_ value: Type?) throws -> Type {
            guard let value = value else { throw ServiceError.invalidFormat }
            return value
        }
        
        private func set(_ item: Item, with id: UUID) throws {
            let itemIndex = try findItemIndexWith(id: id, in: entryItems)
            entryItems[itemIndex] = item
        }
        
        private func findItemWith<T: UIdentifiable>(id: UUID, in array: [T]) throws -> T {
            guard let item = array.first(where: { $0.id == id }) else { throw ServiceError.itemNotFound }
            return item
        }
        
        private func findItemIndexWith<T: UIdentifiable>(id: UUID, in array: [T]) throws -> Int {
            guard let itemIndex = array.firstIndex(where: { $0.id == id }) else { throw ServiceError.itemNotFound }
            return itemIndex
        }
    }
}

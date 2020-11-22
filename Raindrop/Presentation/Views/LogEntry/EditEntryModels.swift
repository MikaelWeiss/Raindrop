//
//  EditEntryModels.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/20/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

extension EditEntry {
    enum ValidateTextEntryValue {
        struct Request {
            let newValue: String
            let id: UUID
        }
        
        struct Response {
            let newValue: String
            let id: UUID
        }
    }
    
    enum ValidateNumberEntryValue {
        struct Request {
            let newValue: String
            let id: UUID
        }
        
        struct Response {
            let newValue: String
            let id: UUID
        }
    }
    
    enum ValidateDateEntry {
        struct Request {
            let newValue: Date
            let id: UUID
        }
        
        struct Response {
            let newValue: Date
            let id: UUID
        }
    }
    
    enum ValidateChecklistSelection {
        struct Request {
            let checklistID: UUID
            let itemID: UUID
        }
        
        struct Response {
            let checklistID: UUID
            let itemID: UUID
        }
    }
    
    enum Strings {
        static let sceneTitle = NSLocalizedString("Some title", comment: "The title for the scene")
        static let textFieldTitle = NSLocalizedString("Some title", comment: "The title for some text field")
    }
    
    class ViewModel: ObservableObject {
        @Published var entryItems: [Item] = [Item(title: "Entry Number", type: .computed("1")), Item(title: "Date", type: .date(Date.now)), Item(title: "Text Entry", type: .text("YES")), Item(title: "Number Entry", type: .number("$999,999,999")), Item(title: "Checklist", type: .checklist([ChecklistItem(value: "Some Name"), ChecklistItem(value: "Some Name"), ChecklistItem(value: "Some Name"), ChecklistItem(value: "Some Name")]))]
    }
}

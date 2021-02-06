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
    
    enum FetchItems {
        struct Response {
            let items: [Item]
        }
    }
    
    enum ValidateTextEntryValue {
        struct Request {
            let newValue: String
            let id: UUID
        }
    }
    
    enum ValidateNumberEntryValue {
        struct Request {
            let newValue: String
            let id: UUID
        }
    }
    
    enum ValidateDateEntry {
        struct Request {
            let newValue: Date
            let id: UUID
        }
    }
    
    enum ValidateChecklistSelection {
        struct Request {
            let checklistID: UUID
            let checklistItemID: UUID
        }
    }
    
    enum ValidateSelectionItemSelection {
        struct Request {
            let selectionID: UUID
            let selectionItemID: UUID
        }
    }
    
    enum ValidateItem {
        struct Response {
            let item: Item
        }
    }
    
    enum CheckCanSave {
        struct Response {
            let canSave: Bool
        }
    }
    
    enum Strings {
        static let sceneTitle = NSLocalizedString("Some title", comment: "The title for the scene")
        static let textFieldTitle = NSLocalizedString("Some title", comment: "The title for some text field")
        static let defaultErrorMessage = NSLocalizedString("Oh no, something unexpected happened", comment: "The default error message")
        static let saveFailedErrorMessage = NSLocalizedString("Oh no, the entry was unable to save", comment: "The save failed error message")
        static let defaultErrorButtonTitle = NSLocalizedString("Ok", comment: "The default error button title")
        static let defaultSaveMessage = NSLocalizedString("Hurray! Save was successful!", comment: "The default save message")
    }
    
    class ViewModel: ObservableObject {
        @Published var entryItems: [Item] = []
        @Published var showError = false
        @Published var showSuccessfulMessage = false
        @Published var canSave = false
        var errorMessage = Strings.defaultErrorMessage
        var saveMessage = Strings.defaultSaveMessage
    }
}

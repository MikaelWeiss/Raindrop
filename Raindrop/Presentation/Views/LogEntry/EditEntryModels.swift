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
    enum ValidateValue {
        struct Request {
            let value: String
        }
        
        struct Response {
            let value: String
        }
    }
    
    enum Strings {
        static let sceneTitle = NSLocalizedString("Some title", comment: "The title for the scene")
        static let textFieldTitle = NSLocalizedString("Some title", comment: "The title for some text field")
    }
    
    class ViewModel: ObservableObject {
        @Published var dateOfEntry = Date.now
        @Published var textEntryValue = ""
        @Published var numberEntryValue = ""
        @Published var currentlySelectedItem: SelectionItem?
        @Published var allItems = [SelectionItem(value: "Some Item")]
        @Published var checklistItems = [ChecklistItem(value: "Some Name")]
    }
}

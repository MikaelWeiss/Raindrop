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
        @Published var title = ""
        @Published var textFieldTitle = ""
        @Published var textFieldValue = ""
        @Published var isShowingOtherScene = false
        @Published var isShowingSheet = false
    }
}

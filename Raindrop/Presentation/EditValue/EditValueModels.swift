//
//  EditValueModels.swift
//  Raindrop
//
//  Created by Mikael Weiss on 10/28/20.
//

import Foundation

extension EditValue {
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
    }
    
    class ViewModel: ObservableObject {
        @Published var title = ""
        @Published var textFieldTitle = ""
        @Published var textFieldValue = ""
        var otherSceneShowing = false
    }
}

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
    
    enum Views {
        case text
        case color
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
        var viewForSheet: Views?
        var viewForNavigationLink: Views?
    }
}

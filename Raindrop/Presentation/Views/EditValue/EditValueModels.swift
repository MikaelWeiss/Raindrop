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
        static let textFieldTitle = NSLocalizedString("Some title", comment: "The title for some text field")
        static let sheetButtonTitle = NSLocalizedString("Open a sheet", comment: "The title for the button that opens the sheet")
        static let navigationLinkButtonTitle = NSLocalizedString("Route to another scene", comment: "The title for the button that navigates to another scene")
    }
    
    class ViewModel: ObservableObject {
        @Published var title = ""
        @Published var textFieldTitle = ""
        @Published var textFieldValue = ""
        @Published var isShowingOtherScene = false
        @Published var isShowingFirstSheet = false
        @Published var isShowingSecondSheet = false
        @Published var sheetButtonTitle = ""
        @Published var navigationLinkButtonTitle = ""
    }
}

//
//  BuildGroupModels.swift
//  Raindrop
//
//  Created by Mikael Weiss on 1/23/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

extension BuildGroup {
    
    enum FetchTheme {
        struct Response {
            let group: EntryGroup
        }
    }
    
    enum ShowError {
        struct Response {
            let error: BuildGroup.ServiceError
        }
    }
    
    enum SelectColor {
        struct Request {
            let color: Color
        }
        struct Response {
            let color: Color
        }
    }
    
    enum ValidateGroupName {
        struct Request {
            let groupName: String
        }
        struct Response {
            let groupName: String
        }
    }
    
    class ViewModel: ObservableObject {
        @Published var group: EntryGroup
        @Published var isShowingEditEntryItem = false
        @Published var displayDidTapCancel = false
        @Published var displayDidTapSave = false
        @Published var displayDidTapGroupName = false
        @Published var displayDidTapAddEntryItem = false
        @Published var displayShowError = false
        var errorTitle = BuildGroup.Strings.errorTitle
        var errorMessage = BuildGroup.Strings.errorMessage
        
        init() {
            // This should never actually display. I just can't make group optional.
            group = EntryGroup(name: "Default Group", groupEntryOutline: [], entrys: [])
        }
    }
    
    enum Strings {
        static let sceneTitle = NSLocalizedString("Some title", comment: "The title for the scene")
        static let errorTitle = NSLocalizedString("Something bad happened", comment: "Generic error title")
        static let errorMessage = NSLocalizedString("Something unexpected happened. Please try again.", comment: "Generic error message")
    }
}

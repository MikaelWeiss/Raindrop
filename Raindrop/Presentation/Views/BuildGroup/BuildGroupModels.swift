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
    
    class ViewModel: ObservableObject {
        @Published var group: EntryGroup
        @Published var isShowingEditEntryItem = false
        @Published var displayDidTapCancel = false
        @Published var displayDidTapSave = false
        @Published var displayDidTapGroupName = false
        @Published var displayDidTapAddEntryItem = false
        @Published var displayShowError = false
        @Published var sceneTintColor = Color.tintColor
        var errorTitle = BuildGroup.Strings.errorTitle
        var errorMessage = BuildGroup.Strings.errorMessage
        
        init() {
            // This should never actually display. I just can't make group optional.
            group = EntryGroup(name: "Some title", groupEntryOutline: [], entrys: [])
        }
    }
    
    enum Strings {
        static let sceneTitle = NSLocalizedString("Some title", comment: "The title for the scene")
        static let errorTitle = NSLocalizedString("Something bad happened", comment: "Generic error title")
        static let errorMessage = NSLocalizedString("Something unexpected happened. Please try again.", comment: "Generic error message")
    }
}

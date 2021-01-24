//
//  BuildGroupModels.swift
//  Raindrop
//
//  Created by Mikael Weiss on 1/23/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

extension BuildGroup {
    enum Strings {
        static let sceneTitle = NSLocalizedString("Some title", comment: "The title for the scene")
        static let textFieldTitle = NSLocalizedString("Some title", comment: "The title for some text field")
    }
    
    class ViewModel: ObservableObject {
        @Published var group = EntryGroup(name: "Some Name", groupEntryOutline: [OutlineType(type: .text)], entrys: [])
        @Published var isShowingEditEntryItem = false
    }
}

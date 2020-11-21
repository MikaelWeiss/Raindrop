//
//  EditEntryPresenter.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/20/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

protocol EditEntryPresenting {
    func presentDidChangeValue(with response: EditEntry.ValidateValue.Response)
    func presentUpdateTheme()
    func presentPrepareRouteToSheet()
    func presentPrepareRouteToOtherScene()
}

struct EditEntryPresenter: EditEntryPresenting {
    let viewModel = EditEntry.ViewModel()
    
    func presentUpdateTheme() {
    }
    
    func presentDidChangeValue(with response: EditEntry.ValidateValue.Response) {
    }
    
    func presentPrepareRouteToSheet() {
    }
    
    func presentPrepareRouteToOtherScene() {
    }
}

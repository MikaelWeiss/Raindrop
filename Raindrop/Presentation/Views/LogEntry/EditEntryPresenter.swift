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
        viewModel.title = EditEntry.Strings.sceneTitle
        viewModel.textFieldTitle = EditEntry.Strings.textFieldTitle
    }
    
    func presentDidChangeValue(with response: EditEntry.ValidateValue.Response) {
        viewModel.textFieldValue = response.value
    }
    
    func presentPrepareRouteToSheet() {
        viewModel.isShowingSheet = true
    }
    
    func presentPrepareRouteToOtherScene() {
        viewModel.isShowingOtherScene = true
    }
}

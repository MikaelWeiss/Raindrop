//
//  BuildGroupPresenter.swift
//  Raindrop
//
//  Created by Mikael Weiss on 1/23/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

protocol BuildGroupPresenting {
    func presentDidChangeValue(with response: BuildGroup.ValidateValue.Response)
    func presentUpdateTheme()
    func presentPrepareRouteToSheet()
    func presentPrepareRouteToOtherScene()
}

struct BuildGroupPresenter: BuildGroupPresenting {
    let viewModel = BuildGroup.ViewModel()
    
    func presentUpdateTheme() {
        viewModel.title = BuildGroup.Strings.sceneTitle
        viewModel.textFieldTitle = BuildGroup.Strings.textFieldTitle
    }
    
    func presentDidChangeValue(with response: BuildGroup.ValidateValue.Response) {
        viewModel.textFieldValue = response.value
    }
    
    func presentPrepareRouteToSheet() {
        viewModel.isShowingSheet = true
    }
    
    func presentPrepareRouteToOtherScene() {
        viewModel.isShowingOtherScene = true
    }
}

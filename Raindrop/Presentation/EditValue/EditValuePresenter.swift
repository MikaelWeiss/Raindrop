//
//  EditValuePresenter.swift
//  Raindrop
//
//  Created by Mikael Weiss on 10/28/20.
//

import Foundation

protocol EditValuePresenting {
    func presentDidChangeValue(with response: EditValue.ValidateValue.Response)
    func presentUpdateTheme()
    func presentPrepareRouteToSheet()
    func presentPrepareRouteToOtherScene()
}

struct EditValuePresenter: EditValuePresenting {
    let viewModel = EditValue.ViewModel()
    
    func presentUpdateTheme() {
        viewModel.title = EditValue.Strings.sceneTitle
        viewModel.textFieldTitle = EditValue.Strings.textFieldTitle
    }
    
    func presentDidChangeValue(with response: EditValue.ValidateValue.Response) {
        viewModel.textFieldValue = response.value
    }
    
    func presentPrepareRouteToSheet() {
        viewModel.isShowingSheet = true
    }
    
    func presentPrepareRouteToOtherScene() {
        viewModel.isShowingOtherScene = true
    }
}

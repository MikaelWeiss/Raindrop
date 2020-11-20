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
    func presentPrepareRouteToFirstSheet()
    func presentPrepareRouteToSecondSheet()
    func presentPrepareRouteToOtherScene()
}

struct EditValuePresenter: EditValuePresenting {
    let viewModel = EditValue.ViewModel()
    
    func presentUpdateTheme() {
        viewModel.title = EditValue.Strings.sceneTitle
        viewModel.textFieldTitle = EditValue.Strings.textFieldTitle
        viewModel.sheetButtonTitle = EditValue.Strings.sheetButtonTitle
        viewModel.navigationLinkButtonTitle = EditValue.Strings.navigationLinkButtonTitle
    }
    
    func presentDidChangeValue(with response: EditValue.ValidateValue.Response) {
        viewModel.textFieldValue = response.value
    }
    
    func presentPrepareRouteToFirstSheet() {
        viewModel.isShowingFirstSheet = true
    }
    
    func presentPrepareRouteToSecondSheet() {
        viewModel.isShowingSecondSheet = true
    }
    
    func presentPrepareRouteToOtherScene() {
        viewModel.isShowingOtherScene = true
    }
}

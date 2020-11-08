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
}

struct EditValuePresenter: EditValuePresenting {
    let viewModel = EditValue.ViewModel()
    
    func presentUpdateTheme() {
        viewModel.title = EditValue.Strings.sceneTitle
        viewModel.textFieldTitle = "Some title"
    }
    
    func presentDidChangeValue(with response: EditValue.ValidateValue.Response) {
        
    }
}

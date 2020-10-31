//
//  EditValueInteractor.swift
//  Raindrop
//
//  Created by Mikael Weiss on 10/28/20.
//

import Foundation

protocol EditValueRequesting {
    func didChangeValue(with request: EditValue.ValidateValue.Request)
    func updateTheme()
}

struct EditValueInteractor: EditValueRequesting {
    private let presenter: EditValuePresenting
    
    init(presenter: EditValuePresenting) {
        self.presenter = presenter
    }
    
    func updateTheme() {
        presenter.presentUpdateTheme()
    }
    
    func didChangeValue(with request: EditValue.ValidateValue.Request) {
        let response = EditValue.ValidateValue.Response(value: request.value)
        presenter.presentDidChangeValue(with: response)
    }
}

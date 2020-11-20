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
    func prepareRouteToFirstSheet()
    func prepareRouteToSecondSheet()
    func prepareRouteToOtherScene()
}

struct EditValueInteractor: EditValueRequesting {
    private let service: EditValueService
    private let presenter: EditValuePresenting
    
    init(service: EditValueService, presenter: EditValuePresenting) {
        self.service = service
        self.presenter = presenter
    }
    
    func updateTheme() {
        presenter.presentUpdateTheme()
    }
    
    func didChangeValue(with request: EditValue.ValidateValue.Request) {
        let response = EditValue.ValidateValue.Response(value: request.value)
        presenter.presentDidChangeValue(with: response)
    }
    
    func prepareRouteToFirstSheet() {
        presenter.presentPrepareRouteToFirstSheet()
    }
    
    func prepareRouteToSecondSheet() {
        presenter.presentPrepareRouteToSecondSheet()
    }
    
    func prepareRouteToOtherScene() {
        presenter.presentPrepareRouteToOtherScene()
    }
}

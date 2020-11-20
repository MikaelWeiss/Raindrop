//
//  EditEntryInteractor.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/20/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol EditEntryRequesting {
    func updateTheme()
    func didChangeValue(with request: EditEntry.ValidateValue.Request)
    func prepareRouteToSheet()
    func prepareRouteToOtherScene()
}

struct EditEntryInteractor: EditEntryRequesting {
    private let service: EditEntryService
    private let presenter: EditEntryPresenting
    
    init(service: EditEntryService, presenter: EditEntryPresenting) {
        self.service = service
        self.presenter = presenter
    }
    
    func updateTheme() {
        presenter.presentUpdateTheme()
    }
    
    func didChangeValue(with request: EditEntry.ValidateValue.Request) {
        let response = EditEntry.ValidateValue.Response(value: request.value)
        presenter.presentDidChangeValue(with: response)
    }
    
    func prepareRouteToSheet() {
        presenter.presentPrepareRouteToSheet()
    }
    
    func prepareRouteToOtherScene() {
        presenter.presentPrepareRouteToOtherScene()
    }
}

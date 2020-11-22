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
    func prepareRouteToSheet()
    func prepareRouteToOtherScene()
    func didChangeTextFieldValue(with request: EditEntry.ValidateTextEntryValue.Request)
    func didChangeNumberEntryValue(with request: EditEntry.ValidateNumberEntryValue.Request)
    func didChangeDate(with request: EditEntry.ValidateDateEntry.Request)
    func didSelectChecklistItem(with request: EditEntry.ValidateChecklistSelection.Request)
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
    
    func didChangeTextFieldValue(with request: EditEntry.ValidateTextEntryValue.Request) {
        let response = EditEntry.ValidateTextEntryValue.Response(newValue: request.newValue, id: request.id)
        presenter.presentDidChangeTextFieldValue(with: response)
    }
    
    func didChangeNumberEntryValue(with request: EditEntry.ValidateNumberEntryValue.Request) {
        let response = EditEntry.ValidateNumberEntryValue.Response(newValue: request.newValue, id: request.id)
        presenter.presentDidChangeNumberEntryValue(with: response)
    }
    
    func didChangeDate(with request: EditEntry.ValidateDateEntry.Request) {
        let response = EditEntry.ValidateDateEntry.Response(newValue: request.newValue, id: request.id)
        presenter.presentDidChangeDate(with: response)
    }
    
    func didSelectChecklistItem(with request: EditEntry.ValidateChecklistSelection.Request) {
        let response = EditEntry.ValidateChecklistSelection.Response(checklistID: request.checklistID, itemID: request.itemID)
        presenter.presentDidSelectChecklistItem(with: response)
    }
    
    func prepareRouteToSheet() {
        presenter.presentPrepareRouteToSheet()
    }
    
    func prepareRouteToOtherScene() {
        presenter.presentPrepareRouteToOtherScene()
    }
}

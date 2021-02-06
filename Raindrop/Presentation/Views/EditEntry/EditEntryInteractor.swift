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
    func fetchItems()
    func didChangeTextFieldValue(with request: EditEntry.ValidateTextEntryValue.Request)
    func didChangeNumberEntryValue(with request: EditEntry.ValidateNumberEntryValue.Request)
    func didChangeDate(with request: EditEntry.ValidateDateEntry.Request)
    func didSelectChecklistItem(with request: EditEntry.ValidateChecklistSelection.Request)
    func didSelectSelectionItem(with request: EditEntry.ValidateSelectionItemSelection.Request)
    func checkCanSave()
    func didTapSave()
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
    
    func fetchItems() {
        let items = service.fetchItems()
        let response = EditEntry.FetchItems.Response(items: items)
        presenter.presentFetchItems(with: response)
    }
    
    func didChangeTextFieldValue(with request: EditEntry.ValidateTextEntryValue.Request) {
        do {
            let item = try service.validateTextFieldInput(request.newValue, id: request.id)
            let response = EditEntry.ValidateItem.Response(item: item)
            presenter.presentUpdateItem(with: response)
        } catch {
            presenter.presentError(error)
        }
    }
    
    func didChangeNumberEntryValue(with request: EditEntry.ValidateNumberEntryValue.Request) {
        do {
            let item = try service.validateNumberInput(request.newValue, id: request.id)
            let response = EditEntry.ValidateItem.Response(item: item)
            presenter.presentUpdateItem(with: response)
        } catch {
            presenter.presentError(error)
        }
    }
    
    func didChangeDate(with request: EditEntry.ValidateDateEntry.Request) {
        do {
            let item = try service.validateDateInput(request.newValue, id: request.id)
            let response = EditEntry.ValidateItem.Response(item: item)
            presenter.presentUpdateItem(with: response)
        } catch {
            presenter.presentError(error)
        }
    }
    
    func didSelectChecklistItem(with request: EditEntry.ValidateChecklistSelection.Request) {
        do {
            let item = try service.validateChecklistInput(checklistID: request.checklistID, checklistItemID: request.checklistItemID)
            let response = EditEntry.ValidateItem.Response(item: item)
            presenter.presentUpdateItem(with: response)
        } catch {
            presenter.presentError(error)
        }
    }
    
    func didSelectSelectionItem(with request: EditEntry.ValidateSelectionItemSelection.Request) {
        do {
            let item = try service.validateSelectionInput(selectionID: request.selectionID, selectionItemID: request.selectionItemID)
            let response = EditEntry.ValidateItem.Response(item: item)
            presenter.presentUpdateItem(with: response)
        } catch {
            presenter.presentError(error)
        }
    }
    
    func checkCanSave() {
        let canSave = service.canSave()
        let response = EditEntry.CheckCanSave.Response(canSave: canSave)
        presenter.presentCheckCanSave(with: response)
    }
    
    func didTapSave() {
        do {
            try service.save()
            presenter.presentDidTapSave()
        } catch {
            presenter.presentError(error)
        }
    }
}

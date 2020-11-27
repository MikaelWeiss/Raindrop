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
    func presentUpdateTheme()
    func presentFetchItems(with response: EditEntry.FetchItems.Response)
    func presentUpdateItem(with response: EditEntry.ValidateItem.Response)
    func presentError(_ error: Error)
    func presentDidTapSave()
    func presentCheckCanSave(with response: EditEntry.CheckCanSave.Response)
}

struct EditEntryPresenter: EditEntryPresenting {
    let viewModel = EditEntry.ViewModel()
    
    func presentUpdateTheme() {
    }
    
    func presentFetchItems(with response: EditEntry.FetchItems.Response) {
        viewModel.entryItems = response.items
    }
    
    func presentUpdateItem(with response: EditEntry.ValidateItem.Response) {
        do {
            let itemIndex = try findItemIndexWith(id: response.item.id, in: viewModel.entryItems)
            viewModel.entryItems[itemIndex] = response.item
        } catch {
            presentError(error)
        }
    }
    
    private func findItemIndexWith<T: UIdentifiable>(id: UUID, in array: [T]) throws -> Int {
        guard let itemIndex = array.firstIndex(where: { $0.id == id }) else { throw EditEntry.ServiceError.itemNotFound }
        return itemIndex
    }
    
    func presentError(_ error: Error) {
        if let error = error as? EditEntry.ServiceError {
            switch error {
            case .invalidFormat, .itemNotFound, .wrongItemType: viewModel.errorMessage = EditEntry.Strings.defaultErrorMessage
            case .saveFailed: viewModel.errorMessage = EditEntry.Strings.saveFailedErrorMessage
            }
        } else {
            viewModel.errorMessage = EditEntry.Strings.defaultErrorMessage
        }
        viewModel.showError = true
    }
    
    func presentDidTapSave() {
        viewModel.saveMessage = EditEntry.Strings.defaultSaveMessage
        viewModel.showSuccessfulMessage = true
    }
    
    func presentCheckCanSave(with response: EditEntry.CheckCanSave.Response) {
        viewModel.canSave = response.canSave
    }
}

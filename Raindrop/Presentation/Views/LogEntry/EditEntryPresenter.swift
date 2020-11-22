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
    func presentPrepareRouteToSheet()
    func presentPrepareRouteToOtherScene()
    func presentDidChangeTextFieldValue(with response: EditEntry.ValidateTextEntryValue.Response)
    func presentDidChangeNumberEntryValue(with response: EditEntry.ValidateNumberEntryValue.Response)
    func presentDidChangeDate(with response: EditEntry.ValidateDateEntry.Response)
    func presentDidSelectChecklistItem(with response: EditEntry.ValidateChecklistSelection.Response)
}

struct EditEntryPresenter: EditEntryPresenting {
    let viewModel = EditEntry.ViewModel()
    
    func presentUpdateTheme() {
    }
    
    func presentDidChangeTextFieldValue(with response: EditEntry.ValidateTextEntryValue.Response) {
        if let index = viewModel.entryItems.firstIndex(where: { $0.id == response.id }) {
//            viewModel.objectWillChange
            viewModel.entryItems[index].type = .text(response.newValue)
        }
    }
    
    func presentDidChangeNumberEntryValue(with response: EditEntry.ValidateNumberEntryValue.Response) {
        if let index = viewModel.entryItems.firstIndex(where: { $0.id == response.id }) {
            viewModel.entryItems[index].type = .number(response.newValue)
        }
    }
    
    func presentDidChangeDate(with response: EditEntry.ValidateDateEntry.Response) {
        if let index = viewModel.entryItems.firstIndex(where: { $0.id == response.id }) {
            viewModel.entryItems[index].type = .date(response.newValue)
        }
    }
    
    func presentDidSelectChecklistItem(with response: EditEntry.ValidateChecklistSelection.Response) {
        guard let checklistIndex = viewModel.entryItems.firstIndex(where: { $0.id == response.checklistID }) else { return }
        guard case let .checklist(list) = viewModel.entryItems[checklistIndex].type else { return }
        guard let itemIndex = list.firstIndex(where: { $0.id == response.itemID }) else { return }
        var temporaryList = list
        temporaryList[itemIndex].isSelected.toggle()
        viewModel.entryItems[checklistIndex].type = .checklist(temporaryList)
    }
    
    func presentPrepareRouteToSheet() {
    }
    
    func presentPrepareRouteToOtherScene() {
    }
}

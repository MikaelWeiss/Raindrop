//
//  BuildGroupPresenter.swift
//  Raindrop
//
//  Created by Mikael Weiss on 1/23/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

protocol BuildGroupPresenting {
    func presentUpdateTheme(with response: BuildGroup.FetchTheme.Response)
    func presentDidTapCancel()
    func presentDidTapSave()
    func presentDidTapGroupName()
    func presentDidTapAddEntryItem()
    func presentShowError(with response: BuildGroup.ShowError.Response)
}

struct BuildGroupPresenter: BuildGroupPresenting {
    let viewModel = BuildGroup.ViewModel()
    
    func presentUpdateTheme(with response: BuildGroup.FetchTheme.Response) {
        viewModel.group = response.group
    }
    
    func presentDidTapCancel() {
        viewModel.displayDidTapCancel = true
    }
    
    func presentDidTapSave() {
        viewModel.displayDidTapSave = true
    }
    
    func presentDidTapGroupName() {
        viewModel.displayDidTapGroupName = true
    }
    
    func presentDidTapAddEntryItem() {
        viewModel.displayDidTapAddEntryItem = true
    }
    
    func presentShowError(with response: BuildGroup.ShowError.Response) {
        switch response.error {
        case .fetchFailed:
            viewModel.errorTitle = BuildGroup.Strings.errorTitle
            viewModel.errorMessage = BuildGroup.Strings.errorMessage
        case .saveFailed:
            viewModel.errorTitle = BuildGroup.Strings.errorTitle
            viewModel.errorMessage = BuildGroup.Strings.errorMessage
        }
        viewModel.displayShowError = true
    }
}

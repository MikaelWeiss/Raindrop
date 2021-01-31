//
//  BuildGroupInteractor.swift
//  Raindrop
//
//  Created by Mikael Weiss on 1/23/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol BuildGroupRequesting {
    func updateTheme()
    func didTapCancel()
    func didTapSave()
    func didTapGroupName()
    func didTapAddEntryItem()
}

struct BuildGroupInteractor: BuildGroupRequesting {
    private let service: BuildGroupService
    private let presenter: BuildGroupPresenting
    
    init(service: BuildGroupService, presenter: BuildGroupPresenting) {
        self.service = service
        self.presenter = presenter
    }
    
    func updateTheme() {
        do {
            let group = try service.fetchGroup()
            let response = BuildGroup.FetchTheme.Response(group: group)
            presenter.presentUpdateTheme(with: response)
        } catch {
            let response = BuildGroup.ShowError.Response(error: error as? BuildGroup.ServiceError ?? .fetchFailed)
            presenter.presentShowError(with: response)
        }
    }
    
    func didTapCancel() {
        presenter.presentDidTapCancel()
    }
    
    func didTapSave() {
        do {
            try service.save()
            presenter.presentDidTapSave()
        } catch {
            let response = BuildGroup.ShowError.Response(error: error as? BuildGroup.ServiceError ?? .saveFailed)
            presenter.presentShowError(with: response)
        }
    }
    
    func didTapGroupName() {
        presenter.presentDidTapGroupName()
    }
    
    func didTapAddEntryItem() {
        presenter.presentDidTapAddEntryItem()
    }
}

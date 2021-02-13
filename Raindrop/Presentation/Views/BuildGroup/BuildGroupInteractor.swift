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
    func didChangeGroupName(with request: BuildGroup.ValidateGroupName.Request)
    func didSelectColor(with request: BuildGroup.SelectColor.Request)
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
    
    func didChangeGroupName(with request: BuildGroup.ValidateGroupName.Request) {
        service.setGroupName(request.groupName)
        let response = BuildGroup.ValidateGroupName.Response(groupName: request.groupName)
        presenter.presentValidateGroupName(with: response)
    }
    
    func didSelectColor(with request: BuildGroup.SelectColor.Request) {
        service.setGroupColor(color: request.color)
        let response = BuildGroup.SelectColor.Response(color: request.color)
        presenter.presentDidSelectColor(with: response)
    }
}


// MARK: - thinking
// This is me thinking about how I can tell the view that there is nothing interesting to display
// Maybe, I make an extension that says "if the scene is in default, then display the content, but redacted, otherwise, just display the content."
enum Default {
    case loaded(Any)
    case inDefault
}

typealias Δ = Default


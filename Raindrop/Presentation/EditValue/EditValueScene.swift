//
//  EditValueScene.swift
//  Raindrop
//
//  Created by Mikael Weiss on 10/28/20.
//

import Foundation

enum EditValue {
    struct Scene {
        let view: EditValueView
        
        init() {
            let service = EditValue.Service()
            let router = EditValueRouter()
            let presenter = EditValuePresenter()
            let interactor = EditValueInteractor(service: service, presenter: presenter, router: router)
            view = EditValueView(interactor: interactor, viewModel: presenter.viewModel)
        }
    }
}

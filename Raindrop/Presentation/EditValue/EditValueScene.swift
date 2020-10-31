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
//            let service = EditValueService()
//            let router = EditValueRouter()
            let presenter = EditValuePresenter()
            let interactor = EditValueInteractor(presenter: presenter)
            view = EditValueView(interactor: interactor, viewModel: presenter.viewModel)
        }
    }
}

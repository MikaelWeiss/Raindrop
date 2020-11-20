//
//  EditEntryScene.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/20/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum EditEntry {
    struct Scene {
        let view: EditEntryView
        
        init() {
            let service = EditEntry.Service()
            let presenter = EditEntryPresenter()
            let interactor = EditEntryInteractor(service: service, presenter: presenter)
            view = EditEntryView(interactor: interactor, viewModel: presenter.viewModel)
        }
        
        private func buildService() -> EditEntryService {
            if true {
                return EditEntry.DemoService()
            }
        }
        
        let service = EditEntry.Service()
    }
}

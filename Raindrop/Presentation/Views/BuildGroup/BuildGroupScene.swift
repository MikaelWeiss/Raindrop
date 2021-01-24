//
//  BuildGroupScene.swift
//  Raindrop
//
//  Created by Mikael Weiss on 1/23/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum BuildGroup {
    struct Scene {
        let view: BuildGroupView
        
        init() {
            let service = BuildGroup.Service()
            let presenter = BuildGroupPresenter()
            let interactor = BuildGroupInteractor(service: service, presenter: presenter)
            view = BuildGroupView(interactor: interactor, viewModel: presenter.viewModel)
        }
        
        private func buildService() -> BuildGroupService {
            if true {
                return BuildGroup.DemoService()
            }
        }
        
        let service = BuildGroup.Service()
    }
}

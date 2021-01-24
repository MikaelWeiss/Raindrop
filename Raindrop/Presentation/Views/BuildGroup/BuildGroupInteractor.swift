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
}

struct BuildGroupInteractor: BuildGroupRequesting {
    private let service: BuildGroupService
    private let presenter: BuildGroupPresenting
    
    init(service: BuildGroupService, presenter: BuildGroupPresenting) {
        self.service = service
        self.presenter = presenter
    }
    
    func updateTheme() {
        presenter.presentUpdateTheme()
    }
}

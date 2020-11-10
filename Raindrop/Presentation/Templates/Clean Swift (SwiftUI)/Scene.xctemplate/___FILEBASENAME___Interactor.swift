//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol ___VARIABLE_sceneName___Requesting {
    func updateTheme()
    func didChangeValue(with request: ___VARIABLE_sceneName___.ValidateValue.Request)
    func prepareRouteToSheet()
    func prepareRouteToOtherScene()
}

struct ___VARIABLE_sceneName___Interactor: ___VARIABLE_sceneName___Requesting {
    private let service: ___VARIABLE_sceneName___Service
    private let presenter: ___VARIABLE_sceneName___Presenting
    
    init(service: ___VARIABLE_sceneName___Service, presenter: ___VARIABLE_sceneName___Presenting) {
        self.service = service
        self.presenter = presenter
    }
    
    func updateTheme() {
        presenter.presentUpdateTheme()
    }
    
    func didChangeValue(with request: ___VARIABLE_sceneName___.ValidateValue.Request) {
        let response = ___VARIABLE_sceneName___.ValidateValue.Response(value: request.value)
        presenter.presentDidChangeValue(with: response)
    }
    
    func prepareRouteToSheet() {
        presenter.presentPrepareRouteToSheet()
    }
    
    func prepareRouteToOtherScene() {
        presenter.presentPrepareRouteToOtherScene()
    }
}

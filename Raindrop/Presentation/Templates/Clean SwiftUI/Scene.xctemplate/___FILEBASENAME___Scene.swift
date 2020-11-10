//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum ___VARIABLE_sceneName___ {
    struct Scene {
        let view: ___VARIABLE_sceneName___View
        
        init() {
            let service = ___VARIABLE_sceneName___.Service()
            let presenter = ___VARIABLE_sceneName___Presenter()
            let interactor = ___VARIABLE_sceneName___Interactor(service: service, presenter: presenter)
            view = ___VARIABLE_sceneName___View(interactor: interactor, viewModel: presenter.viewModel)
        }
        
        private func buildService() -> ___VARIABLE_sceneName___Service {
            if true {
                return ___VARIABLE_sceneName___.DemoService()
            }
        }
        
        let service = ___VARIABLE_sceneName___.Service()
    }
}

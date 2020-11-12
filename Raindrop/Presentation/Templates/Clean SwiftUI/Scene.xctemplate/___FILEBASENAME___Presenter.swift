//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

protocol ___VARIABLE_sceneName___Presenting {
    func presentDidChangeValue(with response: ___VARIABLE_sceneName___.ValidateValue.Response)
    func presentUpdateTheme()
    func presentPrepareRouteToSheet()
    func presentPrepareRouteToOtherScene()
}

struct ___VARIABLE_sceneName___Presenter: ___VARIABLE_sceneName___Presenting {
    let viewModel = ___VARIABLE_sceneName___.ViewModel()
    
    func presentUpdateTheme() {
        viewModel.title = ___VARIABLE_sceneName___.Strings.sceneTitle
        viewModel.textFieldTitle = ___VARIABLE_sceneName___.Strings.textFieldTitle
    }
    
    func presentDidChangeValue(with response: ___VARIABLE_sceneName___.ValidateValue.Response) {
        viewModel.textFieldValue = response.value
    }
    
    func presentPrepareRouteToSheet() {
        viewModel.isShowingSheet = true
    }
    
    func presentPrepareRouteToOtherScene() {
        viewModel.isShowingOtherScene = true
    }
}

//
//  BuildGroupPresenter.swift
//  Raindrop
//
//  Created by Mikael Weiss on 1/23/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import UIKit

protocol BuildGroupPresenting {
    func presentUpdateTheme()
}

struct BuildGroupPresenter: BuildGroupPresenting {
    let viewModel = BuildGroup.ViewModel()
    
    func presentUpdateTheme() {
    }
}

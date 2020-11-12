//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright © ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

protocol ___VARIABLE_sceneName___Inputting {
    func didChangeValue(to value: String)
    func prepareRouteToSheet()
    func prepareRouteToOtherScene()
}

struct ___VARIABLE_sceneName___View: View {
    @ObservedObject private var viewModel: ___VARIABLE_sceneName___.ViewModel
    private let interactor: ___VARIABLE_sceneName___Requesting
    
    init(interactor: ___VARIABLE_sceneName___Requesting, viewModel: ___VARIABLE_sceneName___.ViewModel) {
        self.interactor = interactor
        self.viewModel = viewModel
    }
    
    // MARK: - View Lifecycle
    var body: some View {
        VStack {
            DataEntryCell(
                title: "\(viewModel.textFieldTitle)",
                value: viewModel.textFieldValue,
                onTextChanged:  {
                    didChangeValue(to: $0)
                })
            StandardButton(title: "Open a sheet") {
                prepareRouteToSheet()
            }
            .sheet(isPresented: $viewModel.isShowingSheet) {
                Text("This is a sheet")
            }
            
            StandardButton(title: "Route to another scene") {
                prepareRouteToOtherScene()
            }
            .wrapInNavigationLink(isActive: $viewModel.isShowingOtherScene) {
                Text("This is another scene")
            }
        }
        .wrapInPlainNavigationView()
        .onAppear {
            interactor.updateTheme()
        }
    }
}

// MARK: - Inputing

extension ___VARIABLE_sceneName___View: ___VARIABLE_sceneName___Inputting {
    func didChangeValue(to value: String) {
        let request = ___VARIABLE_sceneName___.ValidateValue.Request(value: value)
        interactor.didChangeValue(with: request)
    }
    
    func prepareRouteToSheet() {
        interactor.prepareRouteToSheet()
    }
    
    func prepareRouteToOtherScene() {
        interactor.prepareRouteToOtherScene()
    }
}

struct ___VARIABLE_sceneName____Previews: PreviewProvider {
    static var previews: some View {
        ___VARIABLE_sceneName___.Scene().view
    }
}

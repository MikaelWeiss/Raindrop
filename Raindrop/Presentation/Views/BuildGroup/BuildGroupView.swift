//
//  BuildGroupView.swift
//  Raindrop
//
//  Created by Mikael Weiss on 1/23/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

protocol BuildGroupInputting {
    func didChangeValue(to value: String)
    func prepareRouteToSheet()
    func prepareRouteToOtherScene()
}

struct BuildGroupView: View {
    @ObservedObject private var viewModel: BuildGroup.ViewModel
    private let interactor: BuildGroupRequesting
    
    init(interactor: BuildGroupRequesting, viewModel: BuildGroup.ViewModel) {
        self.interactor = interactor
        self.viewModel = viewModel
    }
    
    // MARK: - View Lifecycle
    var body: some View {
        VStack {
            TextEntry(
                "\(viewModel.textFieldTitle)",
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

extension BuildGroupView: BuildGroupInputting {
    func didChangeValue(to value: String) {
        let request = BuildGroup.ValidateValue.Request(value: value)
        interactor.didChangeValue(with: request)
    }
    
    func prepareRouteToSheet() {
        interactor.prepareRouteToSheet()
    }
    
    func prepareRouteToOtherScene() {
        interactor.prepareRouteToOtherScene()
    }
}

struct BuildGroup_Previews: PreviewProvider {
    static var previews: some View {
        BuildGroup.Scene().view
    }
}

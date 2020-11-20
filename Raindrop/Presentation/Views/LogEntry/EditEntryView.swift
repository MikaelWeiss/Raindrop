//
//  EditEntryView.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/20/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

protocol EditEntryInputting {
    func didChangeValue(to value: String)
    func prepareRouteToSheet()
    func prepareRouteToOtherScene()
}

struct EditEntryView: View {
    @ObservedObject private var viewModel: EditEntry.ViewModel
    private let interactor: EditEntryRequesting
    
    init(interactor: EditEntryRequesting, viewModel: EditEntry.ViewModel) {
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

extension EditEntryView: EditEntryInputting {
    func didChangeValue(to value: String) {
        let request = EditEntry.ValidateValue.Request(value: value)
        interactor.didChangeValue(with: request)
    }
    
    func prepareRouteToSheet() {
        interactor.prepareRouteToSheet()
    }
    
    func prepareRouteToOtherScene() {
        interactor.prepareRouteToOtherScene()
    }
}

struct EditEntry_Previews: PreviewProvider {
    static var previews: some View {
        EditEntry.Scene().view
    }
}

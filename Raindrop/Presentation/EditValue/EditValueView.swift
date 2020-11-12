//
//  EditValueView.swift
//  Raindrop
//
//  Created by Mikael Weiss on 10/26/20.
//

import SwiftUI

protocol EditValueInputting {
    func didChangeValue(to value: String)
    func prepareRouteToSheet()
    func prepareRouteToOtherScene()
}

struct EditValueView: View {
    @ObservedObject private var viewModel: EditValue.ViewModel
    private let interactor: EditValueRequesting
    
    init(interactor: EditValueRequesting, viewModel: EditValue.ViewModel) {
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
            .sheet(isPresented: $viewModel.sheetShowing) {
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

extension EditValueView: EditValueInputting {
    func didChangeValue(to value: String) {
        let request = EditValue.ValidateValue.Request(value: value)
        interactor.didChangeValue(with: request)
    }
    
    func prepareRouteToSheet() {
        interactor.prepareRouteToSheet()
    }
    
    func prepareRouteToOtherScene() {
        interactor.prepareRouteToOtherScene()
    }
}

struct EditValueView_Previews: PreviewProvider {
    static var previews: some View {
        EditValue.Scene().view
    }
}

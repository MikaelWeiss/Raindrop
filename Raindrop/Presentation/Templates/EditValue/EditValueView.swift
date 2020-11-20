//
//  EditValueView.swift
//  Raindrop
//
//  Created by Mikael Weiss on 10/26/20.
//

import SwiftUI

protocol EditValueInputting {
    func didChangeValue(to value: String)
    func prepareRouteToFirstSheet()
    func prepareRouteToSecondSheet()
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
            
            StandardButton(title: viewModel.sheetButtonTitle) {
                prepareRouteToFirstSheet()
            }
            .sheet(isPresented: $viewModel.isShowingFirstSheet) {
                Text("Showing first sheet")
            }
            
            StandardButton(title: viewModel.sheetButtonTitle) {
                prepareRouteToSecondSheet()
            }
            .sheet(isPresented: $viewModel.isShowingSecondSheet) {
                Text("Showing second sheet")
            }
            
            StandardButton(title: viewModel.navigationLinkButtonTitle) {
                prepareRouteToOtherScene()
            }
            .wrapInNavigationLink(isActive: $viewModel.isShowingOtherScene) {
                Text("Showing view from navigation link")
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
    
    func prepareRouteToFirstSheet() {
        interactor.prepareRouteToFirstSheet()
    }
    
    func prepareRouteToSecondSheet() {
        interactor.prepareRouteToSecondSheet()
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

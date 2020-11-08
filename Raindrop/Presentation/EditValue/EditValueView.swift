//
//  EditValueView.swift
//  Raindrop
//
//  Created by Mikael Weiss on 10/26/20.
//

import SwiftUI

protocol EditValueInputing {
    func didChangeValue(to value: String)
    func prepareRouteToSheet()
    func prepareRouteToOtherScene()
}

struct EditValueView: View {
    let interactor: EditValueRequesting
    @ObservedObject var viewModel: EditValue.ViewModel
    @State private var sheetShowing = false
    @State private var isShowingOtherScene = false
    @State private var isShowingSecondScene = false
    
    // MARK: - View Lifecycle
    var body: some View {
        VStack {
            DataEntryCell(
                title: "\(viewModel.textFieldTitle)",
                value: viewModel.textFieldValue, onTextChanged:  {
                    didChangeValue(to: $0)
                })
            
            StandardButton(title: "Open a sheet") {
                prepareRouteToSheet()
                sheetShowing = true
            }
            
            StandardButton(title: "Route to another scene") {
                prepareRouteToOtherScene()
                isShowingOtherScene = true
            }
            .wrapInNavigationLink(
                isActive: $isShowingOtherScene,
                destination: Text("Sup"))
            
            Text("Sup")
                .wrapInNavigationLink(isActive: $isShowingSecondScene, destination: Text("Sup"))
        }
        .wrapInNavigationView()
        .onAppear {
            interactor.updateTheme()
        }
        .sheet(isPresented: $sheetShowing) {
            Group {
                
            }
        }
    }
}

// MARK: Inputing

extension EditValueView: EditValueInputing {
    func didChangeValue(to value: String) {
        let request = EditValue.ValidateValue.Request(value: value)
        interactor.didChangeValue(with: request)
    }
    
    func prepareRouteToSheet() {
        
    }
    
    func prepareRouteToOtherScene() {
        
    }
}

struct EditValueView_Previews: PreviewProvider {
    static var previews: some View {
        EditValue.Scene().view
    }
}

struct StandardButton: View {
    let title: String
    let onTap: () -> Void
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .cellStyle()
            .foregroundColor(.blue)
            .overlay (
                Text(title).fontStyle()
            )
            .onTapGesture {
                onTap()
            }
    }
}

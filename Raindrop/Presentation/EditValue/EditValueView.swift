//
//  EditValueView.swift
//  Raindrop
//
//  Created by Mikael Weiss on 10/26/20.
//

import SwiftUI

protocol EditValueInputing {
    func didChangeValue(to value: String)
}

struct EditValueView: View {
    let interactor: EditValueRequesting
    @ObservedObject var viewModel: EditValue.ViewModel
    @State var otherSceneShowing = false
    
    // MARK: - View Lifecycle
    var body: some View {
        VStack {
            DataEntryCell(
                title: "\(viewModel.textFieldTitle)",
                value: viewModel.textFieldValue) {
                didChangeValue(to: $0)
            }
            StandardButton(title: "Go to a different scene") {
                
            }
        }
        .onAppear {
            interactor.updateTheme()
        }
        .sheet(isPresented: $otherSceneShowing, content: {
            EditValue.Scene().view
        })
    }
}

// MARK: Displaying

extension EditValueView: EditValueInputing {
    func didChangeValue(to value: String) {
        let request = EditValue.ValidateValue.Request(value: value)
        interactor.didChangeValue(with: request)
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

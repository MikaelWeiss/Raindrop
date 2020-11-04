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
    
    // MARK: - View Lifecycle
    var body: some View {
        VStack {
            EntryField(value: viewModel.textFieldText, onTextChanged: didChangeValue(to:))
            StandardButton()
        }
        .onAppear {
            interactor.updateTheme()
        }
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

struct EntryField: View {
    let value: String
    let onTextChanged: (String) -> Void
    
    var body: some View {
        let binding = Binding<String>(
            get: {
                value
            }, set: {
                onTextChanged($0)
            })
        TextField("Some title", text: binding)
            .cellStyle()
    }
}

struct StandardButton: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .cellStyle()
            .foregroundColor(.blue)
            .overlay(Text("Go to other scene"))
    }
}

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
        //        TextField("Some Value", text: $value.text)
        //            .padding()
        Text(viewModel.title)
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

//struct EditValueView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditValueView()
//    }
//}

class EditingText: ObservableObject {
    let onValueChanged: (String) -> Void
    
    @Published var text: String = "" {
        didSet {
            onValueChanged(text)
        }
    }
    
    init(onValueChanged: @escaping (String) -> Void) {
        self.onValueChanged = onValueChanged
    }
}

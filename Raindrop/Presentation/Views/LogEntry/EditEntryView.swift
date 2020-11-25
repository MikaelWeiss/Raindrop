//
//  EditEntryView.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/20/20.
//  Copyright © 2020 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

protocol EditEntryInputting {
    func didChangeTextValue(to value: String, withID id: UUID)
    func didChangeNumberEntryValue(to value: String, withID id: UUID)
    func didChangeDate(to value: Date, withID id: UUID)
    func didSelectChecklistItem(checklistID: UUID, itemID: UUID)
    func didSelectSelectionItem(selectionID: UUID, itemID: UUID)
    func prepareRouteToSheet()
    func prepareRouteToOtherScene()
}

struct EditEntryView: View {
    @ObservedObject private var viewModel: EditEntry.ViewModel
    private let interactor: EditEntryRequesting
    
    init(interactor: EditEntryRequesting, viewModel: EditEntry.ViewModel) {
        self.interactor = interactor
        self.viewModel = viewModel
        
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = false
    }
    
    // MARK: - View Lifecycle
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                LazyVStack(alignment: .leading, spacing: 0) {
                    Color(.systemBackground).frame(height: 60)
                    
                    ForEach(viewModel.entryItems) { item in
                        switch item.type {
                        case let .text(value): TextEntry(item.title, value: value) { didChangeTextValue(to: $0, withID: item.id) }
                        case let .number(value): NumberEntry(item.title, value: value) { didChangeNumberEntryValue(to: $0, withID: item.id) }
                        case let .date(value): DateSelection(item.title, value: value) { didChangeDate(to: $0, withID: item.id) }
                        case let .computed(value): ComputedValue(title: item.title, value: value)
                        case let .checklist(value): Checklist(item.title, value: value) { didSelectChecklistItem(checklistID: item.id, itemID: $0) }
                        case let .selection(value): ItemSelectionCell(item.title, value: value) { didSelectSelectionItem(selectionID: item.id, itemID: $0) }
                        default: Text("I'm not working right")
                        }
                    }
                    
                    StandardButton(title: "Save", onTap: { } )
                }
            }
            GroupSelectionBar()
        }
        .navigationTitle("Some Group Type")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            interactor.updateTheme()
        }
    }
}

// MARK: - Inputing

extension EditEntryView: EditEntryInputting {
    func didChangeTextValue(to value: String, withID id: UUID) {
        let request = EditEntry.ValidateTextEntryValue.Request(newValue: value, id: id)
        interactor.didChangeTextFieldValue(with: request)
    }
    
    func didChangeNumberEntryValue(to value: String, withID id: UUID) {
        let request = EditEntry.ValidateNumberEntryValue.Request(newValue: value, id: id)
        interactor.didChangeNumberEntryValue(with: request)
    }
    
    func didChangeDate(to value: Date, withID id: UUID) {
        let request = EditEntry.ValidateDateEntry.Request(newValue: value, id: id)
        interactor.didChangeDate(with: request)
    }
    
    func didSelectChecklistItem(checklistID: UUID, itemID: UUID) {
        let request = EditEntry.ValidateChecklistSelection.Request(checklistID: checklistID, itemID: itemID)
        interactor.didSelectChecklistItem(with: request)
    }
    
    func didSelectSelectionItem(selectionID: UUID, itemID: UUID) {
        let request = EditEntry.ValidateSelectionItemSelection.Request(selectionID: selectionID, itemID: itemID)
        interactor.didSelectSelectionItem(with: request)
    }
    
    func prepareRouteToSheet() {
        interactor.prepareRouteToSheet()
    }
    
    func prepareRouteToOtherScene() {
        interactor.prepareRouteToOtherScene()
    }
}

// MARK: - Previews

struct EditEntry_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditEntry.Scene().view
        }.colorScheme(.dark)
    }
}

//struct TextView: UIViewRepresentable {
//    @Binding var text: String
//
//    func makeUIView(context: Context) -> UITextView {
//        return UITextView()
//    }
//
//    func updateUIView(_ uiView: UITextView, context: Context) {
//        uiView.text = text
//    }
//}

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
                LazyVStack(alignment: .leading) {
                    Color(.systemBackground).frame(height: 60)
                    
                    ForEach(viewModel.entryItems) { item in
                        switch item.type {
                        case let .text(value): TextEntry(item.title, value: value) { didChangeTextValue(to: $0, withID: item.id) }
                        case let .number(value): NumberEntry(item.title, value: value) { didChangeNumberEntryValue(to: $0, withID: item.id) }
                        case let .date(value): DateSelection(item.title, value: value) { didChangeDate(to: $0, withID: item.id) }
                        case let .computed(value): ComputedValue(title: item.title, value: value)
                        case let .checklist(value): Checklist(item.title, value: value) { didSelectChecklistItem(checklistID: item.id, itemID: $0) }
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

// MARK: - Other Views

struct GroupSelectionItem: View {
    var body: some View {
        ZStack(alignment: .center) {
            Circle()
                .frame(width: 35, height: 35, alignment: .center)
                .foregroundColor(Color(hex: 0x3d5a73))
            Text("A")
                .foregroundColor(Color(#colorLiteral(red: 0.03318550438, green: 0.06916820258, blue: 0.2289170027, alpha: 1)))
                .fontWeight(.heavy)
        }
    }
}

struct GroupSelectionBar: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach (0 ..< 10) {_ in
                    GroupSelectionItem()
                }
            }
            .padding(.horizontal, 8)
        }
        .frame(height: 50, alignment: .leading)
        .frame(maxWidth: .infinity)
        .background(Color(hex: 0xc1d1d1d))
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .padding(10)
        .background(Color(.systemBackground))
    }
}

struct ComputedValue: View {
    let title: String
    let value: String
    
    var body: some View {
        HorizontalDataEntryCell(title: title) {
            Text(value)
        }
    }
}

struct DateSelection: View {
    let title: String
    let value: Date
    let onDateChanged: (Date) -> Void
    
    init(_ title: String, value: Date, onDateChanged: @escaping (Date) -> Void) {
        self.title = title
        self.value = value
        self.onDateChanged = onDateChanged
    }

    var body: some View {
        let binding = Binding(get: { value }, set: { onDateChanged($0) })
        HorizontalDataEntryCell(title: title) {
            DatePicker(title, selection: binding)
                .labelsHidden()
        }
    }
}

struct TextEntry: View {
    let title: String
    let value: String
    let onTextChanged: (String) -> Void
    
    init(_ title: String, value: String, onTextChanged: @escaping (String) -> Void) {
        self.title = title
        self.value = value
        self.onTextChanged = onTextChanged
    }
    
    var body: some View {
        let binding = Binding(
            get: {
                value
            },
            set: {
                onTextChanged($0)
            })
        VerticalDataEntryCell(title: title) {
            TextField("Enter Value Here", text: binding)
        }
    }
}

struct NumberEntry: View {
    let title: String
    let value: String
    let onValueChanged: (String) -> Void
    
    init(_ title: String, value: String, onValueChanged: @escaping (String) -> Void) {
        self.title = title
        self.value = value
        self.onValueChanged = onValueChanged
    }

    var body: some View {
        let binding = Binding(get: { value }, set: { onValueChanged($0) })
        HorizontalDataEntryCell(title: title) {
            TextField("Enter Number", text: binding)
                .frame(width: 164)
                .multilineTextAlignment(.trailing)
        }
    }
}

struct VerticalDataEntryCell<Content>: View where Content: View {
    let title: String
    let content: () -> Content

    init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            content().valueFontStyle()
        }.cellStyle()
    }
}

struct HorizontalDataEntryCell<Content>: View where Content: View {
    let title: String
    let content: () -> Content

    init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            content().valueFontStyle()
        }.cellStyle()
    }
}
//
//struct ItemSelectionCell: View {
//    let item: Item<ItemSelectionValue, SelectionItem?>
//
//    init(item: Item<ItemSelectionValue, SelectionItem?>) {
//        self.item = item
//    }
//
//    @State private var isShowingSelectionSheet: Bool = false
//
//    var body: some View {
//        let currentlySelectedItem = self.item.value.currentlySelectedItem
//
//        HorizontalDataEntryCell(title: "Item Selection") {
//            Text(currentlySelectedItem?.value ?? "Select Value")
//            Image(systemName: "arrowtriangle.down.square.fill")
//        }
//        .onTapGesture {
//            isShowingSelectionSheet = true
//        }
//        .sheet(isPresented: $isShowingSelectionSheet) {
//            ItemSelectionView(item: self.item, isShowing: $isShowingSelectionSheet)
//        }
//    }
//}
//
//struct ItemSelectionValue {
//    let items: [SelectionItem]
//    let currentlySelectedItem: SelectionItem?
//}
//
//struct ItemSelectionView: View {
//    let item: Item<ItemSelectionValue, SelectionItem?>
//
//    init(item: Item<ItemSelectionValue, SelectionItem?>, isShowing: Binding<Bool>) {
//        self.item = item
//        self._isShowing = isShowing
//    }
//
//    @Binding var isShowing: Bool
//
//    var body: some View {
//        let currentlySelectedItem = self.item.value.currentlySelectedItem
//        ScrollView {
//            ForEach(item.value.items) { item in
//                HStack {
//                    Image(systemName: item.id == currentlySelectedItem?.id ? "square.fill" : "square")
//                    Text(item.value)
//                    Spacer()
//                }
//                .valueFontStyle()
//                .cellStyle()
//                .onTapGesture {
//                    self.isShowing = false
//                    self.item.onValueChanged(item)
//                }
//            }
//        }
//    }
//}
//

struct Checklist: View {
    let title: String
    let value: [ChecklistItem]
    let onValueChanged: (UUID) -> Void
    
    init(_ title: String, value: [ChecklistItem], onValueChanged: @escaping (UUID) -> Void) {
        self.title = title
        self.value = value
        self.onValueChanged = onValueChanged
    }

    var body: some View {
        VerticalDataEntryCell(title: "Checklist") {
            ForEach(value) { item in
                HStack {
                    Image(systemName: item.isSelected ? "square.fill" : "square")
                    Text(item.value)
                    Color(.systemBackground)
                }
                .frame(height: 30)
                .valueFontStyle()
                .onTapGesture {
                    onValueChanged(item.id)
                }
            }
        }
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

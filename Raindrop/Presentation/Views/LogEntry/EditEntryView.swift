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
    let title = "Entry Number"
    let value = "1,000,000,000"
    
    var body: some View {
        HorizontalDataEntryCell(title: title) {
            Text(value)
        }
    }
}
//
//struct DateSelection: View {
//    let item: Item<Date, Date>
//
//    init(_ entryItem: Item<Date, Date>) {
//        item = entryItem
//    }
//
//    var body: some View {
//        let binding = Binding(get: { item.value }, set: { item.onValueChanged($0) })
//        HorizontalDataEntryCell(title: item.title) {
//            DatePicker(item.title, selection: binding)
//                .labelsHidden()
//        }
//    }
//}

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
//struct Checklist: View {
//    let item: Item<[ChecklistItem], Int>
//
//    init(_ entryItem: Item<[ChecklistItem], Int>) {
//        item = entryItem
//    }
//
//    var body: some View {
//        VerticalDataEntryCell(title: "Checklist") {
//            ScrollView {
//                ForEach(item.value) { item in
//                    HStack {
//                        Image(systemName: item.isSelected ? "square.fill" : "square")
//                        Text(item.value)
//                        Spacer()
//                    }
//                    .valueFontStyle()
//                    .onTapGesture {
//                        if let index = self.item.value.firstIndex(where: { $0.id == item.id } ) {
//                            self.item.onValueChanged(index)
//                        }
//                    }
//                }
//            }
//        }
//    }
//}

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

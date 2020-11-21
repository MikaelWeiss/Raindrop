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
        
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = false
    }
    
    // MARK: - View Lifecycle
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    Color(.systemBackground).frame(height: 60)
                    ComputedValue()
                    DateSelection($viewModel.dateOfEntry)
                    TextEntry($viewModel.textEntryValue)
                    NumberEntry($viewModel.numberEntryValue)
                    ItemSelectionCell(allItems: $viewModel.allItems, currentlySelectedItem: $viewModel.currentlySelectedItem)
                    Checklist(items: $viewModel.checklistItems)
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

struct DateSelection: View {
    let title: String = "Date"
    @Binding var dateOfEntry: Date
    init(_ dateOfEntry: Binding<Date>) {
        _dateOfEntry = dateOfEntry
    }
    
    var body: some View {
        HorizontalDataEntryCell(title: title) {
            DatePicker(title, selection: $dateOfEntry)
                .labelsHidden()
        }
    }
}

struct TextEntry: View {
    @Binding var value: String
    let title = "Text Entry Value"
    
    init(_ value: Binding<String>) {
        _value = value
    }
    
    var body: some View {
        VerticalDataEntryCell(title: title) {
            TextField("Enter Value Here", text: $value)
        }
    }
}

struct NumberEntry: View {
    @Binding var value: String
    let title = "Number Entry Value"
    
    init(_ value: Binding<String>) {
        _value = value
    }
    
    var body: some View {
        HorizontalDataEntryCell(title: title) {
            TextField("Enter Number", text: $value)
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

struct ItemSelectionCell: View {
    @Binding var allItems: [SelectionItem]
    @Binding var currentlySelectedItem: SelectionItem?
    @State private var isShowingSelectionSheet = false
    
    var body: some View {
        HorizontalDataEntryCell(title: "Item Selection") {
            Text(currentlySelectedItem?.value ?? "Select Value")
            Image(systemName: "arrowtriangle.down.square.fill")
        }
        .onTapGesture {
            isShowingSelectionSheet = true
        }
        .sheet(isPresented: $isShowingSelectionSheet) {
            ItemSelectionView(items: allItems, currentlySelectedItem: $currentlySelectedItem, viewShowing: $isShowingSelectionSheet)
        }
    }
}

struct ItemSelectionView: View {
    let items: [SelectionItem]
    @Binding var currentlySelectedItem: SelectionItem?
    @Binding var viewShowing: Bool
    
    var body: some View {
        ScrollView {
            ForEach(items) { item in
                HStack {
                    Image(systemName: item.id == currentlySelectedItem?.id ? "square.fill" : "square")
                    Text(item.value)
                    Spacer()
                }
                .valueFontStyle()
                .cellStyle()
                .onTapGesture {
                    if currentlySelectedItem?.id == item.id {
                        currentlySelectedItem = nil
                    } else {
                        currentlySelectedItem = item
                    }
                    viewShowing = false
                }
            }
        }
    }
}

struct Checklist: View {
    @Binding var items: [ChecklistItem]
    
    var body: some View {
        VerticalDataEntryCell(title: "Checklist") {
            ScrollView {
                ForEach(items) { item in
                    HStack {
                        Image(systemName: item.isSelected ? "square.fill" : "square")
                        Text(item.value)
                        Spacer()
                    }
                    .valueFontStyle()
                    .onTapGesture {
                        if let index = items.firstIndex(where: { $0.id == item.id } ) {
                            items[index].isSelected.toggle()
                        }
                    }
                }
            }
        }
    }
}

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
    var body: some View {
        HStack {
            Text("Entry Number")
            Spacer()
            Text("1,000,000,000")
                .valueFontStyle()
        }
        .cellStyle()
    }
}

struct DateSelection: View {
    @Binding var dateOfEntry: Date
    init(_ dateOfEntry: Binding<Date>) {
        _dateOfEntry = dateOfEntry
    }
    
    var body: some View {
        HStack {
            Text("Date")
            Spacer()
            DatePicker("Date", selection: $dateOfEntry)
                .labelsHidden()
        }
        .cellStyle()
    }
}

struct TextEntry: View {
    @Binding var value: String
    let title = "Text Entry Value"
    
    init(_ value: Binding<String>) {
        _value = value
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            TextField("Enter Value Here", text: $value)
                .valueFontStyle()
        }
        .cellStyle()
    }
}

struct NumberEntry: View {
    @Binding var value: String
    let title = "Number Entry Value"
    
    init(_ value: Binding<String>) {
        _value = value
    }
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            TextField("Enter Number", text: .constant("999,999,999,999"))
                .frame(width: 164)
                .multilineTextAlignment(.trailing)
                .valueFontStyle()
        }
        .cellStyle()
    }
}

struct VerticalDataEntryCell<Content>: View where Content: View {
    let title: LocalizedStringKey
    let content: Content
    
    init(title: LocalizedStringKey, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = Content
    }
    
    var body: some View {
        Text(title)
    }
}

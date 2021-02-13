//
//  BuildGroupView.swift
//  Raindrop
//
//  Created by Mikael Weiss on 1/23/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import SwiftUI

protocol BuildGroupInputting {
    func didTapCancel()
    func didTapSave()
    func didTapGroupName()
    func didTapAddEntryItem()
    func didChangeGroupName(_ name: String)
    func didSelectColor(color: Color)
}

struct BuildGroupView: View {
    @ObservedObject private var viewModel: BuildGroup.ViewModel
    private let interactor: BuildGroupRequesting
    
    init(interactor: BuildGroupRequesting, viewModel: BuildGroup.ViewModel) {
        self.interactor = interactor
        self.viewModel = viewModel
        
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(named: "AccentColor")!]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(named: "AccentColor")!]
    }
    
    // MARK: - View Lifecycle
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 20) {
                    TextEntry("Group Name", value: viewModel.group.name, withoutCellStyle: true) { didChangeGroupName($0) }
                    HStack {
                        ColorSelector(title: "GroupColor", currentlySelectedColor: viewModel.group.tintColor) {
                            didSelectColor(color: $0)
                        }
                    }
                }
                .cellStyle()
                .overlay(
                    Text("Group Info")
                        .padding(.horizontal, 5)
                        .background(Color(.systemBackground))
                        .padding(.leading)
                        .offset(y: -10)
                        .fontStyle(viewModel.group.tintColor),
                    alignment: .topLeading)
                // Items
                ForEach(viewModel.group.groupEntryOutline) { item in
                    switch item.type {
                    case .text: BuildGroupView.OutlineCell(title: "Text") { didTapAddEntryItem() }
                    case .number: BuildGroupView.OutlineCell(title: "Number") { didTapAddEntryItem() }
                    case .timer: BuildGroupView.OutlineCell(title: "Timer: Coming Soon!") { didTapAddEntryItem() }
                    case .date: BuildGroupView.OutlineCell(title: "Date") { didTapAddEntryItem() }
                    case .selection: BuildGroupView.OutlineCell(title: "Selection") { didTapAddEntryItem() }
                    case .checklist: BuildGroupView.OutlineCell(title: "Checklist") { didTapAddEntryItem() }
                    case .computed: BuildGroupView.OutlineCell(title: "Computed") { didTapAddEntryItem() }
                    }
                }
                
                // Add Entry Item
                HStack(alignment: .center) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(viewModel.group.tintColor)
                        .font(.system(size: 20, weight: .black))
                    Text("Add Entry Item")
                }
                .cellStyle()
                .padding(.bottom, 32)
                .onTapGesture { didTapAddEntryItem() }
            }
            .padding(.horizontal)
        }
        .navigationBarTitle(viewModel.group.name, displayMode: .automatic)
        .navigationBarItems(
            leading: (
                Button("Cancel") { didTapCancel() }
            ),
            trailing: (
                Button("Save") { didTapSave() }
            ))
        .onAppear {
            interactor.updateTheme()
        }
    }
    
    func showModal() {
        let window = UIApplication.shared.windows.first
        window?.rootViewController?.present(UIHostingController(rootView: EditEntry.Scene().view), animated: true)
//        window?.rootViewController?.show(UIHostingController(rootView: EditEntry.Scene().view), sender: nil)
    }
}

// MARK: - Inputing

extension BuildGroupView: BuildGroupInputting {
    func didTapCancel() {
        interactor.didTapCancel()
    }
    
    func didTapSave() {
        interactor.didTapSave()
    }
    
    func didTapGroupName() {
        interactor.didTapGroupName()
    }
    
    func didTapAddEntryItem() {
        interactor.didTapAddEntryItem()
    }
    
    func didChangeGroupName(_ name: String) {
        let request = BuildGroup.ValidateGroupName.Request(groupName: name)
        interactor.didChangeGroupName(with: request)
    }
    
    func didSelectColor(color: Color) {
        let request = BuildGroup.SelectColor.Request(color: color)
        interactor.didSelectColor(with: request)
    }
}

struct BuildGroup_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BuildGroup.Scene().view
        }.colorScheme(.dark)
    }
}

extension BuildGroupView {
    struct OutlineCell: View {
        let title: String
        let callback: () -> Void
        
        var body: some View {
            HStack(spacing: 0) {
                Text(title)
                Color(.systemBackground)
            }
            .cellStyle()
            .onTapGesture { callback() }
        }
    }
}

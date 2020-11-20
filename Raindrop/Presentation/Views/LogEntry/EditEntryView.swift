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
                    HStack {
                        Text("Entry Number")
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .foregroundColor(Color(#colorLiteral(red: 0.5411272645, green: 0.5412079692, blue: 0.5411095023, alpha: 1)))
                        Spacer()
                        Text("1,000,000,000")
                            .fontWeight(.heavy)
                            .foregroundColor(Color(#colorLiteral(red: 0.2500658035, green: 0.4984801412, blue: 0.65720433, alpha: 1)))
                    }
                    .font(.system(size: 18, weight: .bold, design: .rounded))
                    .padding([.horizontal, .bottom])
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

struct EditEntry_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditEntry.Scene().view
        }.colorScheme(.dark)
    }
}

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
        .padding(.all, 10)
        .background(Color(.systemBackground))
    }
}

//
//  ItemSelection.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/24/20.
//

import SwiftUI

struct ItemSelectionCell: View {
    let title: String
    let value: Selection
    let onValueChanged: (UUID) -> Void
    
    init(_ title: String, value: Selection, onValueChanged: @escaping (UUID) -> Void) {
        self.title = title
        self.value = value
        self.onValueChanged = onValueChanged
    }
    
    @State private var isShowingSelectionSheet: Bool = false
    
    var body: some View {
        let currentlySelectedItem = value.currentlySelectedItem
        HStack {
            Text(title)
            Spacer()
            Text(currentlySelectedItem?.title ?? "Select Value")
                .valueFontStyle()
                .lineLimit(1)
            Image(systemName: "arrowtriangle.down.square.fill")
                .valueFontStyle()
        }.cellStyle()
        .onTapGesture {
            isShowingSelectionSheet = true
        }
        .sheet(isPresented: $isShowingSelectionSheet) {
            ItemSelectionView(value: value, isShowing: $isShowingSelectionSheet) { onValueChanged($0) }
        }
    }
}

struct ItemSelectionView: View {
    let value: Selection
    let onValueChanged: (UUID) -> Void
    @Binding var isShowing: Bool
    
    init(value: Selection, isShowing: Binding<Bool>, onValueChanged: @escaping (UUID) -> Void) {
        self.value = value
        self._isShowing = isShowing
        self.onValueChanged = onValueChanged
    }
    
    var body: some View {
        let currentlySelectedItem = value.currentlySelectedItem
        
        ScrollView {
            ForEach(value.items) { item in
                HStack {
                    Image(systemName: item.id == currentlySelectedItem?.id ? "circle.fill" : "circle")
                    Text(item.title)
                    Spacer()
                }
                .padding(.vertical, 5)
                .valueFontStyle()
                .onTapGesture {
                    self.isShowing = false
                    self.onValueChanged(item.id)
                }
            }
            .cellStyle()
        }
    }
}

struct ItemSelection_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ItemSelectionCell("Some title",
                              value: Selection(
                                items: [Selection.SelectionItem(
                                            title: "Some selection item")],
                                currentlySelectedItem: nil),
                              onValueChanged: {_ in })
            
            ItemSelectionCell("Some title",
                              value: Selection(
                                items: [Selection.SelectionItem(
                                            title: "Some selection item"), Selection.SelectionItem(
                                                title: "Some selection item"), Selection.SelectionItem(
                                                    title: "Some selection item")],
                                currentlySelectedItem: nil),
                              onValueChanged: {_ in })
                .background(Color(.systemBackground))
                .colorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}

//
//  GroupSelectionBar.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/24/20.
//

import SwiftUI

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
        .padding(.trailing, 8)
    }
}

struct GroupSelectionBar: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach (0 ..< 10) {_ in
                    GroupSelectionItem()
                }
            }
            .padding(.horizontal, 8)
        }
        .frame(height: 50, alignment: .leading)
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray4))
        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
        .padding(10)
        .background(Color(.systemBackground))
    }
}

struct GroupSelectionBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GroupSelectionBar()
            GroupSelectionBar()
                .colorScheme(.dark)
        }
        .previewLayout(.sizeThatFits)
    }
}

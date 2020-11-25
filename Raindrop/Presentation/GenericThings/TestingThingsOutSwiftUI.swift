//
//  TestingThingsOutSwiftUI.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/24/20.
//

import SwiftUI

struct TestingThingsOutSwiftUI: View {
    var body: some View {
        Group {
            Text("Text 1")
            Text("Text 2")
        }
    }
}

struct TestingThingsOutSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        TestingThingsOutSwiftUI()
            .previewLayout(.sizeThatFits)
    }
}

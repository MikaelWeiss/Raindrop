//
//  TestingThingsOutSwiftUI.swift
//  Raindrop
//
//  Created by Mikael Weiss on 11/24/20.
//

import SwiftUI

struct TestingThingsOutSwiftUI: View {
    let textFieldBinding: Binding<String> = Binding(
        get: { ViewModel.textValue },
        set: {
            ViewModel.textValue = $0
            print(ViewModel.textValue)
        })
    
    @State private var showOtherScene = false
    
    var val = {
        ViewModel.textValue
    }
    
    var body: some View {
        VStack {
            Text(val())
            TextField("Some Placeholder", text: textFieldBinding)
            StandardButton(title: "Route", onTap: { showOtherScene = !showOtherScene })
                .wrapInNavigationLink(isActive: $showOtherScene, destination: { Text(val())})
        }
    }
}

struct TestingThingsOutSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        TestingThingsOutSwiftUI()
    }
}

enum ViewModel {

    static var textValue = "Something"
}

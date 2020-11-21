//
//  RaindropApp.swift
//  Raindrop
//
//  Created by Mikael Weiss on 9/26/20.
//

import SwiftUI

@main
struct RaindropApp: App {
    @State private var selectedTab = Tabs.editValue
    
    enum Tabs: Hashable {
        case editValue
        case secondTab
    }
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                NavigationView {
                    EditEntry.Scene().view
                }
                    .tabItem {
                        Image(systemName: "pencil.circle.fill")
                        Text("Entry")
                    }.tag(Tabs.editValue)
                Text("Tab Content 2")
                    .tabItem {
                        Image(systemName: "line.horizontal.3.circle")
                        Text("Overview")
                    }.tag(Tabs.secondTab)
            }
        }
    }
}

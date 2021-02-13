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
    @ObservedObject var viewCoordinator = ViewCoordinator.shared
    
    enum Tabs: Hashable {
        case editValue
        case secondTab
    }
    
    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedTab) {
                NavigationView {
                    BuildGroup.Scene().view
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
            .overlay(
                viewCoordinator.currentView
                    .ignoresSafeArea()
            )
            .colorScheme(.dark)
        }
    }
}

class ViewCoordinator: ObservableObject {
    static var shared = ViewCoordinator()
    
    @Published var currentView: AnyView?
}

//
//  SmartProtectionApp.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 14/07/2024.
//

import SwiftUI

@main
struct SmartProtectionApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var welcomeLogic = WelcomeLogic(welcome: Welcome(currentView: .register(type: .personalData)))

    var body: some Scene {
        WindowGroup {
//            WelcomeView(welcome: welcomeLogic)
            TabBarView(tabBarLogic: TabBarLogic(tabBar: TabBar(selectedViewType: .jobTracker)))
        }
    }
}

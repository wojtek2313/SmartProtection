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
    @StateObject var starterLogic = StarterLogic()

    var body: some Scene {
        WindowGroup {
            StarterView(logic: starterLogic)
        }
    }
}

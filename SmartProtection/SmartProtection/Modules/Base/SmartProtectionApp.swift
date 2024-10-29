//
//  SmartProtectionApp.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 14/07/2024.
//

import SwiftUI

@main
struct SmartProtectionApp: App {
    /// Registration of application delegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    let persistenceController = PersistenceController.shared
    var appFlowCoordinator = AppFlowCoordinator()

    var body: some Scene {
        WindowGroup {
            appFlowCoordinator.startAppFlow.preferredColorScheme(.light)
        }
    }
}

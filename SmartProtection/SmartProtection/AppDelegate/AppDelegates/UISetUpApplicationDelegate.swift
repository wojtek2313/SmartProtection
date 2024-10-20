//
//  UISetUpApplicationDelegate.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 17/10/2024.
//

import UIKit

final class UISetUpApplicationDelegate: UIResponder & UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UINavigationBar.appearance().backIndicatorImage = UIImage(systemName: Constants.Image.systemName)
        UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(systemName: Constants.Image.systemName)
        return true
    }
    
    private struct Constants {
        struct Image {
            static let systemName: String = "arrow.ackward.circle.fill"
        }
    }
}

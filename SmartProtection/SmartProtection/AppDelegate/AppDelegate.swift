//
//  AppDelegate.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 17/10/2024.
//

import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate {
    // MARK: - Typealiases
    
    typealias AppDelegateType = UIResponder & UIApplicationDelegate
    
    // MARK: - Private Properties
    
    private let appDelegates: [AppDelegateType]
    
    override init() {
        self.appDelegates = [UISetUpApplicationDelegate()]
    }
    
    // MARK: - Public Methods
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        appDelegates.forEach { _ = $0.application?(application, didFinishLaunchingWithOptions: launchOptions) }
        return true
    }
}

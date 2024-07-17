//
//  WelcomeLogic.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 15/07/2024.
//

import SwiftUI
import SmartProtectionUI

class WelcomeLogic: ObservableObject {
    // MARK: - Private Properties
    
    @Published private var welcome: Welcome
    
    // MARK: - Public Properties
    
    var currentWelcomeViewType: WelcomeViewType {
        welcome.currentView
    }
    
    var indexOfCurrentlySelectedView: Int {
        welcome.indexOfCurrentlySelectedView
    }
    
    var areCurrentViewDataValid: Bool {
        welcome.areCurrentViewDataValid
    }
    
    // MARK: - Initializers
    
    init(welcome: Welcome) {
        self.welcome = welcome
    }
    
    // MARK: - Public Methods
    
    func presentNextViewAtTheHierarchy(currentViewType type: WelcomeViewType) {
        welcome.presentNextViewAtTheHierarchy(currentViewType: type)
    }
    
    func presentView(at type: WelcomeViewType) {
        welcome.presentView(at: type)
    }
    
    func insertUserData(with newValue: String, fromTextFieldWithType type: SPTextFieldType) {
        welcome.insertUserData(with: newValue, fromTextFieldWithType: type)
    }
}

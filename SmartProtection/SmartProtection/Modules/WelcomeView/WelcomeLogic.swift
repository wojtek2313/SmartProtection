//
//  WelcomeLogic.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 15/07/2024.
//

import SwiftUI
import SmartProtectionUI

public class WelcomeLogic: ObservableObject {
    // MARK: - Private Properties
    
    @Published private var welcome: WelcomeProtocol
    
    // MARK: - Public Properties
    
    public var currentWelcomeViewType: WelcomeViewType {
        welcome.currentView
    }
    
    public var indexOfCurrentlySelectedView: Int {
        welcome.indexOfCurrentlySelectedView
    }
    
    public var areCurrentViewDataValid: Bool {
        welcome.areCurrentViewDataValid
    }
    
    // MARK: - Initializers
    
    public init(welcome: WelcomeProtocol) {
        self.welcome = welcome
    }
    
    // MARK: - Public Methods
    
    public func presentNextViewAtTheHierarchy() {
        welcome.presentNextViewAtTheHierarchy()
    }
    
    public func presentView(at type: WelcomeViewType) {
        welcome.presentView(at: type)
    }
    
    public func insertUserData(with newValue: String, fromTextFieldWithType type: SPTextFieldType) {
        welcome.insertUserData(with: newValue, fromTextFieldWithType: type)
    }
    
    /// Network Layer Communication
    
    public func buildUserModelDTO() -> UserDto? {
        return welcome.buildUserModel.toDTO
    }
}

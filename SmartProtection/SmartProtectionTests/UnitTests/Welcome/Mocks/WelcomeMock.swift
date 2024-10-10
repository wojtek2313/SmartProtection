//
//  WelcomeMock.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 19/07/2024.
//

import Foundation
@testable import SmartProtection
import SmartProtectionUI

struct WelcomeMock: WelcomeProtocol {
    // MARK: - Private Properties
    
    private var user: SmartProtection.Welcome.User
    
    // MARK: - Public Properties
    
    var currentView: SmartProtection.WelcomeViewType
    
    var indexOfCurrentlySelectedView: Int {
        currentView.tag
    }
    
    var areCurrentViewDataValid: Bool {
        switch currentView {
        case .login: return validateLoginData()
        case .register(let type): return validateRegistrationData(at: type)
        case .forgotPassword(let type): return validateForgotPasswordData(at: type)
        }
    }
    
    var buildUserModel: SmartProtection.Welcome.User {
        return user
    }
    
    // MARK: - Initializers
    
    init(currentView: SmartProtection.WelcomeViewType) {
        user = .init()
        self.currentView = currentView
    }
    
    // MARK: - Public Methods
    
    mutating func insertUserData(with newValue: String, fromTextFieldWithType type: SmartProtectionUI.SPTextFieldType) {
        switch type {
        case .login: user.mail = newValue
        case .password: user.password = newValue
        case .name: user.name = newValue
        case .surname: user.surname = newValue
        case .company: user.company = newValue
        case .mobile: user.mobile = newValue
        case .newPassword: user.password = newValue
        case .newLogin: user.mail = newValue
        }
    }
    
    mutating func presentNextViewAtTheHierarchy() {
        switch currentView {
        case .login, .forgotPassword(type: _): break
        case .register(let type):
            switch type {
            case .personalData: currentView = .register(type: .companyData)
            case .companyData: currentView = .register(type: .password)
            case .password: break
            }
        }
    }
    
    mutating func presentView(at type: SmartProtection.WelcomeViewType) {
        currentView = type
    }
    
    // MARK: - Private Methods
    
    private func validateLoginData() -> Bool {
        return user.mail != nil && user.password != nil
    }
    
    private func validateRegistrationData(at type: RegistrationViewType) -> Bool {
        switch type {
        case .personalData: return user.name != nil && user.surname != nil
        case .companyData: return user.company != nil && user.mobile != nil
        case .password: return user.mail != nil && user.password != nil
        }
    }
    
    private func validateForgotPasswordData(at type: ForgotPasswordViewType) -> Bool {
        switch type {
        case .login: return user.mail != nil
        case .password: return user.password != nil
        }
    }
}

//
//  Welcome.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 17/07/2024.
//

import Foundation
import SmartProtectionUI

struct Welcome {
    // MARK: - Public Properties
    
    private var user: User
    private(set) var currentView: WelcomeViewType
    
    var indexOfCurrentlySelectedView: Int { currentView.tag }
    
    var areCurrentViewDataValid: Bool {
        switch currentView {
        case .login: return validateLoginData()
        case .register(let type): return validateRegistrationData(at: type)
        case .forgotPassword(let type): return validateForgotPasswordData(at: type)
        }
    }
    
    init(currentView: WelcomeViewType) {
        user = User()
        self.currentView = currentView
    }
    
    // MARK: - Public Methods
    
    public mutating func insertUserData(with newValue: String, fromTextFieldWithType type: SPTextFieldType) {
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
    
    public mutating func presentNextViewAtTheHierarchy(currentViewType type: WelcomeViewType) {
        switch type {
        case .login, .forgotPassword(type: _): break
        case .register(let type):
            switch type {
            case .personalData: currentView = .register(type: .companyData)
            case .companyData: currentView = .register(type: .password)
            case .password: break
            }
        }
    }
    
    public mutating func presentView(at type: WelcomeViewType) {
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
    
    // MARK: - Model
    
    struct User {
        var name: String?
        var surname: String?
        var company: String?
        var mobile: String?
        var mail: String?
        var password: String?
    }
}

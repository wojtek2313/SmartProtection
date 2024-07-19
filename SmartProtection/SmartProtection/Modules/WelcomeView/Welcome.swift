//
//  Welcome.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 17/07/2024.
//

import Foundation
import SmartProtectionUI

public protocol WelcomeProtocol {
    var currentView: WelcomeViewType { get }
    var indexOfCurrentlySelectedView: Int { get }
    var areCurrentViewDataValid: Bool { get }
    var buildUserModel: Welcome.User { get }
    
    mutating func insertUserData(with newValue: String, fromTextFieldWithType type: SPTextFieldType)
    mutating func presentNextViewAtTheHierarchy()
    mutating func presentView(at type: WelcomeViewType)
}

public struct Welcome: WelcomeProtocol {
    // MARK: - Public Properties
    
    private var user: User
    public private(set) var currentView: WelcomeViewType
    
    public var indexOfCurrentlySelectedView: Int { currentView.tag }
    
    public var areCurrentViewDataValid: Bool {
        switch currentView {
        case .login: return validateLoginData()
        case .register(let type): return validateRegistrationData(at: type)
        case .forgotPassword(let type): return validateForgotPasswordData(at: type)
        }
    }
    
    public var buildUserModel: User { user }
    
    public init(currentView: WelcomeViewType) {
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
    
    public mutating func presentNextViewAtTheHierarchy() {
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
    
    public struct User: Equatable {
        // MARK: - Public Properties
        
        public var name: String?
        public var surname: String?
        public var company: String?
        public var mobile: String?
        public var mail: String?
        public var password: String?
        
        // MARK: - Initializers
        
        public init(
            name: String? = nil,
            surname: String? = nil,
            company: String? = nil,
            mobile: String? = nil,
            mail: String? = nil,
            password: String? = nil
        ) {
            self.name = name
            self.surname = surname
            self.company = company
            self.mobile = mobile
            self.mail = mail
            self.password = password
        }
    }
}

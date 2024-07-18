//
//  StarterViewType.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 15/07/2024.
//

import SwiftUI
import SmartProtectionUI

public enum RegistrationViewType {
    case personalData
    case companyData
    case password
    
    public var textfieldTypes: (upperTextFieldType: SPTextFieldType, bottomTextFieldType: SPTextFieldType?) {
        switch self {
        case .personalData: return (.name, .surname)
        case .companyData: return (.company, .mobile)
        case .password: return (.newLogin, .newPassword)
        }
    }
    
    public var spButtonType: SPButtonType {
        switch self {
        case .personalData: return .next
        case .companyData: return .next
        case .password: return .register
        }
    }
    
    public var tag: Int {
        switch self {
        case .personalData: return 0
        case .companyData: return 1
        case .password: return 2
        }
    }
}

public enum ForgotPasswordViewType {
    case login
    case password
    
    public var textfieldTypes: (upperTextFieldType: SPTextFieldType, bottomTextFieldType: SPTextFieldType?) {
        switch self {
        case .login: return (.login, nil)
        case .password: return (.newPassword, nil)
        }
    }
    
    public var spButtonType: SPButtonType {
        switch self {
        case .login:
            return .reset
        case .password:
            return .newPassword
        }
    }
    
    public var tag: Int {
        switch self {
        case .login: return 0
        case .password: return 1
        }
    }
}

public enum WelcomeViewType: Equatable {
    case login
    case register(type: RegistrationViewType)
    case forgotPassword(type: ForgotPasswordViewType)
    
    public var textfieldTypes: (upperTextFieldType: SPTextFieldType, bottomTextFieldType: SPTextFieldType?) {
        switch self {
        case .login: return (.login, .password)
        case .register(let type): return type.textfieldTypes
        case .forgotPassword(let type): return type.textfieldTypes
        }
    }
    
    public var spButtonType: SPButtonType {
        switch self {
        case .login: return .login
        case .register(let type): return type.spButtonType
        case .forgotPassword(let type): return type.spButtonType
        }
    }
    
    public var spHeaderIconType: SPHeaderIconType {
        switch self {
        case .login: return .login
        case .register(_): return .register
        case .forgotPassword(_): return .chagePassword
        }
    }
    
    public var tag: Int {
        switch self {
        case .login: return 0
        case .register(let type): return type.tag
        case .forgotPassword(let type): return type.tag
        }
    }
}

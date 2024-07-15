//
//  StarterViewType.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 15/07/2024.
//

import SwiftUI
import SmartProtectionUI

enum RegistrationViewType {
    case personalData
    case companyData
    case password
    
    var textfieldTypes: (upperTextFieldType: SPTextFieldType, bottomTextFieldType: SPTextFieldType?) {
        switch self {
        case .personalData: return (.name, .surname)
        case .companyData: return (.company, .mobile)
        case .password: return (.password, nil)
        }
    }
    
    var spButtonType: SPButtonType {
        switch self {
        case .personalData: return .next
        case .companyData: return .next
        case .password: return .register
        }
    }
}

enum ForgotPasswordViewType {
    case login
    case password
    
    var textfieldTypes: (upperTextFieldType: SPTextFieldType, bottomTextFieldType: SPTextFieldType?) {
        switch self {
        case .login: return (.login, nil)
        case .password: return (.newPassword, nil)
        }
    }
    
    var spButtonType: SPButtonType {
        switch self {
        case .login:
            return .reset
        case .password:
            return .newPassword
        }
    }
}

enum StarterViewType: Equatable {
    case login
    case register(type: RegistrationViewType)
    case forgotPassword(type: ForgotPasswordViewType)
    
    var textfieldTypes: (upperTextFieldType: SPTextFieldType, bottomTextFieldType: SPTextFieldType?) {
        switch self {
        case .login: return (.login, .password)
        case .register(let type): return type.textfieldTypes
        case .forgotPassword(let type): return type.textfieldTypes
        }
    }
    
    var spButtonType: SPButtonType {
        switch self {
        case .login: return .login
        case .register(let type): return type.spButtonType
        case .forgotPassword(let type): return type.spButtonType
        }
    }
    
    var spHeaderIconType: SPHeaderIconType {
        switch self {
        case .login: return .login
        case .register(_): return .register
        case .forgotPassword(_): return .chagePassword
        }
    }
}

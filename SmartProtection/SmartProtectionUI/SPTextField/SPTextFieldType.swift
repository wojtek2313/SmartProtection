//
//  SPTextFieldType.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 14/07/2024.
//

import Foundation

public enum SPTextFieldType {
    case login
    case password
    case name
    case surname
    case company
    case mobile
    
    var title: String {
        switch self {
        case .login:
            return "SP_TEXT_FIELD_LOGIN".localized
        case .password:
            return "SP_TEXT_FIELD_PASSWORD".localized
        case .name:
            return "SP_TEXT_FIELD_NAME".localized
        case .surname:
            return "SP_TEXT_FIELD_SURNAME".localized
        case .company:
            return "SP_TEXT_FIELD_COMPANY".localized
        case .mobile:
            return "SP_TEXT_FIELD_MOBILE".localized
        }
    }
    
    var placeholder: String {
        switch self {
        case .login:
            return "SP_TEXT_FIELD_LOGIN_PLACEHOLDER".localized
        case .password:
            return "SP_TEXT_FIELD_PASSWORD_PLACEHOLDER".localized
        case .name:
            return "SP_TEXT_FIELD_NAME_PLACEHOLDER".localized
        case .surname:
            return "SP_TEXT_FIELD_SURNAME_PLACEHOLDER".localized
        case .company:
            return "SP_TEXT_FIELD_COMPANY_PLACEHOLDER".localized
        case .mobile:
            return "SP_TEXT_FIELD_MOBILE_PLACEHOLDER".localized
        }
    }
    
    var inputHideable: Bool { self == .password }
}

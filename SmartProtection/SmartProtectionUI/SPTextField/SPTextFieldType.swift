//
//  SPTextFieldType.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 14/07/2024.
//

import Foundation

public enum SPTextFieldType: String {
    case login
    case password
    case name
    case surname
    case company
    case mobile
    case newPassword
    case newLogin
    case whatHasHappend
    
    public var title: String {
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
        case .newPassword:
            return "SP_TEXT_FIELD_NEW_PASSWORD".localized
        case .newLogin:
            return "SP_TEXT_FIELD_NEW_LOGIN".localized
        case .whatHasHappend:
            return "SP_TEXT_FIELD_WHAT_HAS_HAPPEND".localized
        }
    }
    
    public var placeholder: String {
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
        case .newPassword:
            return "SP_TEXT_FIELD_NEW_PASSWORD_PLACEHOLDER".localized
        case .newLogin:
            return "SP_TEXT_FIELD_NEW_LOGIN_PLACEHOLDER".localized
        case .whatHasHappend:
            return "SP_TEXT_FIELD_NEW_LOGIN_PLACEHOLDER".localized
        }
    }
    
    public var inputHideable: Bool { self == .password || self == .newPassword }
}

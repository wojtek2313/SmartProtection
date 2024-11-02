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
    case whatItemUnderFire
    case whatHasBeenRobbed
    case whatIsUnderCollision
    case whichMachineIsUnderDamaged
    
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
        case .whatItemUnderFire:
            return "SP_TEXT_FIELD_WHAT_IS_UNDER_FIRE".localized
        case .whatHasBeenRobbed:
            return "SP_TEXT_FIELD_WHAT_HAS_BEEN_ROBBED".localized
        case .whatIsUnderCollision:
            return "SP_TEXT_FIELD_WHAT_IS_UNDER_COLLISION".localized
        case .whichMachineIsUnderDamaged:
            return "SP_TEXT_FIELD_WHICH_MACHINE_IS_DAMAGED".localized
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
            return "SP_TEXT_FIELD_WHAT_HAS_HAPPEND".localized
        case .whatItemUnderFire:
            return "SP_TEXT_FIELD_WHAT_IS_UNDER_FIRE_PLACEHOLDER".localized
        case .whatHasBeenRobbed:
            return "SP_TEXT_FIELD_WHAT_HAS_BEEN_ROBBED".localized
        case .whatIsUnderCollision:
            return "SP_TEXT_FIELD_COLLISION_PLACEHOLDER".localized
        case .whichMachineIsUnderDamaged:
            return "SP_TEXT_FIELD_WHAT_IS_UNDER_FIRE_PLACEHOLDER".localized
        }
    }
    
    public var inputHideable: Bool { self == .password || self == .newPassword }
}

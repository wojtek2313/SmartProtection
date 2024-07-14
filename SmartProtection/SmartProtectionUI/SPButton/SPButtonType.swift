//
//  SPButtonType.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 14/07/2024.
//

import Foundation
import SwiftUI

public enum SPButtonType {
    case login
    case next
    case reset
    case register
    case newPassword
    
    var title: String {
        switch self {
        case .login:
            return "SP_BUTTON_LOG_IN".localized
        case .next:
            return "SP_BUTTON_NEXT".localized
        case .reset:
            return "SP_BUTTON_REGISTER".localized
        case .register:
            return "SP_BUTTON_RESET_PASSWORD".localized
        case .newPassword:
            return "SP_BUTTON_SET_NEW_PASSWORD".localized
        }
    }
    
    var color: Color {
        .spBlue
    }
}

//
//  SPHeaderIconType.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 15/07/2024.
//

import Foundation
import SwiftUI

public enum SPHeaderIconType {
    case login
    case register
    case chagePassword
    
    public var icon: Image {
        switch self {
        case .login, .register:
            return Image("log-in-icon")
        case .chagePassword:
            return Image("pass_icon")
        }
    }
    
    public var title: String { "SP_HEADER_ICON_TITLE".localized }
    
    public var subtitle: String {
        switch self {
        case .login:
            return "SP_HEADER_ICON_LOG_IN".localized
        case .register:
            return "SP_HEADER_ICON_REGISTER".localized
        case .chagePassword:
            return "SP_HEADER_ICON_CHANGE_PASSWORD".localized
        }
    }
}

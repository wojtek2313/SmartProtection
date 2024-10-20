//
//  SoberItem.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 20/10/2024.
//

import SmartProtectionUI
import Foundation

public enum SoberItem: SPRadioButtonItem {
    case yes
    case no
    case dontKnow
    
    public var title: String {
        switch self {
        case .yes: return "SP_YES".localized
        case .no: return "SP_NO".localized
        case .dontKnow: return "SP_DONT_KNOW".localized
        }
    }
    
    public var id: String {
        switch self {
        case .yes: return "0"
        case .no: return "1"
        case .dontKnow: return "2"
        }
    }
}

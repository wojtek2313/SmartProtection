//
//  ExchangeItem.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 31/10/2024.
//

import SmartProtectionUI
import Foundation

public enum ExchangeItem: SPRadioButtonItem {
    case yes
    case no
    
    public var title: String {
        switch self {
        case .yes:
            return "SP_YES".localized;
        case .no:
            return "SP_NO".localized;
        }
    }
    
    public var rawValue: Bool {
        switch self {
        case .yes: return true
        case .no: return false
        }
    }
    
    public var id: String {
        switch self {
        case .yes:
            return "0"
        case .no:
            return "1"
        }
    }
}

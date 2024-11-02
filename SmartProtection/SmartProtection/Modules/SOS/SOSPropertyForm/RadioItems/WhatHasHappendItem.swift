//
//  WhatHasHappendItem.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 31/10/2024.
//

import Foundation
import SmartProtectionUI

public enum WhatHasHappendItem: SPRadioButtonItem {
    case fire
    case robbery
    case collision
    case machineDamage
    case other
    
    public var title: String {
        switch self {
        case .fire: return "SOS_PROPERTY_FORM_FIRE".localized
        case .robbery: return "SOS_PROPERTY_FORM_ROBERRY".localized
        case .collision: return "SOS_PROPERTY_FORM_COLLISION".localized
        case .machineDamage: return "SOS_PROPERTY_MACHINE_DAMAGE".localized
        case .other: return "SP_OTHERS".localized
        }
    }
    
    public var id: String {
        switch self {
        case .fire: return "0"
        case .robbery: return "1"
        case .collision: return "2"
        case .machineDamage: return "3"
        case .other: return "4"
        }
    }
}

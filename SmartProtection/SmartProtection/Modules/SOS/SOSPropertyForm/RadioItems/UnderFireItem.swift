//
//  UnderFireItem.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 31/10/2024.
//

import SmartProtectionUI
import Foundation

public enum UnderFireItem: SPRadioButtonItem {
    case machine
    case buiding
    case other
    
    public var title: String {
        switch self {
        case .machine:
            return "SOS_PROPERTY_MACHINE_UNDER_THE_FIRE".localized
        case .buiding:
            return "SOS_PROPERTY_BUILDING_UNDER_THE_FIRE".localized
        case .other:
            return "SP_OTHERS".localized
        }
    }
    
    public var id: String {
        switch self {
        case .machine:
            return "0"
        case .buiding:
            return "1"
        case .other:
            return "3"
        }
    }
}

//
//  ReasonItem.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 18/10/2024.
//

import SmartProtectionUI
import Foundation

public enum ReasonItem: SPRadioButtonItem {
    case falldownAccident
    case equipmentAccident
    case electricityAccident
    case chemicalsAccident
    case others
    
    public var title: String {
        switch self {
        case .falldownAccident: return "SOS_FIRST_AID_FALLDOWN".localized
        case .equipmentAccident: return "SOS_FIRST_AID_EQUIPMENT".localized
        case .electricityAccident: return "SOS_FIRST_AID_ELECTRICITY".localized
        case .chemicalsAccident: return "SOS_FIRST_AID_CHEMICALS".localized
        case .others: return "SP_OTHERS".localized
        }
    }
    
    public var id: String {
        switch self {
        case .falldownAccident: return "0"
        case .equipmentAccident: return "1"
        case .electricityAccident: return "2"
        case .chemicalsAccident: return "3"
        case .others: return "4"
        }
    }
}

//
//  SymptomItem.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 20/10/2024.
//

import SmartProtectionUI
import Foundation

public enum SymptomItem: SPRadioButtonItem {
    case fractures
    case headache
    case stomachache
    case vomits
    case slurredSpeech
    case gettingLost
    case others
    
    public var title: String {
        switch self {
        case .fractures: return "SOS_FIRST_AID_FRACTURES".localized
        case .headache: return "SOS_FIRST_AID_HEADACHE".localized
        case .stomachache: return "SOS_FIRST_AID_STOMACHACHE".localized
        case .vomits: return "SOS_FIRST_AID_VOMITS".localized
        case .slurredSpeech: return "SOS_FIRST_AID_SLURRED_SPEECH".localized
        case .gettingLost: return "SOS_FIRST_AID_GETTING_LOST".localized
        case .others: return "SP_OTHERS".localized
        }
    }
    
    public var id: String {
        switch self {
        case .fractures:
            return "0"
        case .headache:
            return "1"
        case .stomachache:
            return "2"
        case .vomits:
            return "3"
        case .slurredSpeech:
            return "4"
        case .gettingLost:
            return "5"
        case .others:
            return "6"
        }
    }
}

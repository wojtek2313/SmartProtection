//
//  TabViewContentType.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 24/07/2024.
//

import SwiftUI

public enum SPTabViewContentType {
    case jobTracker
    case sos
    case userSettings
    
    // MARK: - Public Properties
    
    public var systemImage: String {
        switch self {
        case .jobTracker: return "house.fill"
        case .sos: return "sos.circle.fill"
        case .userSettings: return "gear"
        }
    }
    
    public var foregroundColor: Color {
        switch self {
        case .jobTracker, .userSettings: return .gray
        case .sos: return .red
        }
    }
    
    public var font: Font {
        switch self {
        case .jobTracker, .userSettings: return .title2
        case .sos: return .largeTitle
        }
    }
}

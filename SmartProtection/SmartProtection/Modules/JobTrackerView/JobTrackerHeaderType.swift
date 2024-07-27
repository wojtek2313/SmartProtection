//
//  JobTrackerHeaderType.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 27/07/2024.
//

import Foundation

public enum JobTrackerHeaderType {
    case constructionCard
    case timer
    case bhp
    case documents
    
    public var title: String {
        switch self {
        case .constructionCard: return "JOB_TRACKER_CONSTRUCTION_ID".localized
        case .timer: return "JOB_TRACKER_TIME_OF_WORK".localized
        case .bhp: return "JOB_TRACKER_BHP".localized
        case .documents: return "JOB_TRACKER_DOCUMENTS".localized
        }
    }
    
    public var subtitle: String {
        switch self {
        case .constructionCard: return "JOB_TRACEKR_CONSTRUCTION_ID_SUBTITLE".localized
        case .timer, .bhp: return ""
        case .documents: return "JOB_TRACKER_DOCUMENTS_SUBTITLE".localized
        }
    }
}

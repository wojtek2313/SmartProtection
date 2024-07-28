//
//  SPProgress.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 28/07/2024.
//

import Foundation

public struct SPProgress {
    // MARK: - Private Properties
    
    private var numberOfTotalDailyWorkHours: Int
    private var timer: Timer
    
    // MARK: - Public Properties
    
    public var progress: Float {
        Float(timer.hourDifference) / timer.numberOfMinutesToWorkInProgressFormat
    }
    
    public var time: String {
        let interval = Int(timer.hourDifference)
        let hours = (interval / (60*60)) % 60
        let minutes = (interval / 60) % 60
        return "\(hours)h : \(minutes)min"
    }
    
    // MARK: - Initializers
    
    public init(numberOfTotalDailyWorkHours: Int, timer: Timer) {
        self.numberOfTotalDailyWorkHours = numberOfTotalDailyWorkHours
        self.timer = timer
    }
    
    // MARK: - Model
    
    public struct Timer {
        // MARK: - Private Properties
        
        private let startHour: Date
        private let numberOfHoursToWork: Int
        private let dateFormatter = DateFormatter()
        
        // MARK: - Public Properties
        
        var hourDifference: TimeInterval {
            let start = startHour.timeIntervalSince1970
            let now = Date().timeIntervalSince1970
            let difference = now - start
            return difference
        }
        
        var numberOfMinutesToWorkInProgressFormat: Float {
            Float(numberOfHoursToWork) * Constants.numberOfMinutesInHour * Constants.numberOfDegreesInCircle
        }
        
        // MARK: - Initializers
        
        public init(startHour: Date, numberOfHoursToWork: Int) {
            self.startHour = startHour
            self.numberOfHoursToWork = numberOfHoursToWork
        }
        
        // MARK: - Constants
        
        private struct Constants {
            static let numberOfMinutesInHour: Float = 60
            static let numberOfDegreesInCircle: Float = 360
        }
    }
}

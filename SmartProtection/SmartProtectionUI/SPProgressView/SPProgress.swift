//
//  SPProgress.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 28/07/2024.
//

import Foundation

public protocol SPProgressProtocol {
    var progress: Float { get }
    var time: String { get }
}

public struct SPProgress: SPProgressProtocol {
    // MARK: - Private Properties
    
    private var numberOfTotalDailyWorkHours: Int
    private var timer: Timer
    
    private var hour: Int {
        Int(timer.hourDifference) / (60*60) % 60
    }
    
    private var minute: Int {
        (Int(timer.hourDifference) / 60) % 60
    }
    
    
    // MARK: - Public Properties
    
    public var progress: Float { Float(hour) / Float(numberOfTotalDailyWorkHours) }
    
    public var time: String { "\(hour)h : \(minute)min" }
    
    // MARK: - Initializers
    
    public init(numberOfTotalDailyWorkHours: Int, timer: Timer) {
        self.numberOfTotalDailyWorkHours = numberOfTotalDailyWorkHours
        self.timer = timer
    }
    
    // MARK: - Model
    
    public struct Timer {
        // MARK: - Private Properties
        
        private let startHour: Date
        private let dateFormatter = DateFormatter()
        
        // MARK: - Public Properties
        
        var hourDifference: TimeInterval {
            let start = startHour.timeIntervalSince1970
            let now = Date().timeIntervalSince1970
            let difference = now - start
            return difference
        }
        
        // MARK: - Initializers
        
        public init(startHour: Date) {
            self.startHour = startHour
        }
        
        // MARK: - Constants
        
        private struct Constants {
            static let numberOfMinutesInHour: Float = 60
            static let numberOfDegreesInCircle: Float = 360
        }
    }
}

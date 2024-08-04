//
//  DependencyFactory.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 02/08/2024.
//

import Foundation
import SmartProtectionUI

enum DependencyType {
    case progress
    case welcome
}

class DependencyFactory {
    private var factoryStore: [DependencyType: Any] = [:]
    
    public func registerProgressDependencies(numberOfTotalDailyWorkHours: Int, startHour: Date) {
        var timer = SPProgress.Timer(startHour: startHour)
        var progress = SPProgress(numberOfTotalDailyWorkHours: numberOfTotalDailyWorkHours, timer: timer)
        var progressLogic = SPProgressLogic(progress: progress)
        factoryStore[.progress] = progressLogic
    }
    
    public func registerWelcomeDependencies(currentView: WelcomeViewType) {
        var welcomeModel = Welcome(currentView: currentView)
        var welcomeLogic = WelcomeLogic(welcome: welcomeModel)
        factoryStore[.welcome] = welcomeLogic
    }
}

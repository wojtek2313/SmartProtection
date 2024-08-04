//
//  DependenciesFactory.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 02/08/2024.
//

import Foundation
import SmartProtectionUI

final class DependenciesFacotry {
    // MARK: - Public Properties
    
    public static let shared = DependenciesFacotry()
    
    // MARK: - Initializers
    
    private init() {}
    
    // MARK: - Public Methods
    
    func createTabBarLogic(selectedViewType: TabBar.SelectedViewType) -> TabBarLogic {
        let tabBar = TabBar(selectedViewType: selectedViewType)
        let tabBarLogic = TabBarLogic(tabBar: tabBar)
        return tabBarLogic
    }
    
    func createProgress(numberOfTotalDailyWorkHours: Int, startHour: Date) -> SPProgressLogic
    {
        let timer = SPProgress.Timer(startHour: startHour)
        let progress = SPProgress(numberOfTotalDailyWorkHours: numberOfTotalDailyWorkHours, timer: timer)
        let progressLogic = SPProgressLogic(progress: progress)
        return progressLogic
    }
}

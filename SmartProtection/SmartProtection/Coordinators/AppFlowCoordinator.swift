//
//  AppFlowCoordinator.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 02/08/2024.
//

import SwiftUI

class AppFlowCoordinator {
    // MARK: - Private Properties
    
    private var numberOfTotalDailyWorkHours: Int? = nil
    private var dependencyFactory: DependenciesFacotry
    private var isUserLogeddIn: Bool = true
    
    init() {
        dependencyFactory = DependenciesFacotry.shared
    }
    
    @ViewBuilder
    public var startAppFlow: some View {
        if isUserLogeddIn {
            tabBarView
        } else {
            loginView
        }
    }
    
    private var tabBarView: some View {
        let logic = dependencyFactory.createTabBarLogic(selectedViewType: .jobTracker)
        return TabBarView(tabBarLogic: logic, dependencyFactory: dependencyFactory)
    }
    
    private var loginView: some View {
        Text("")
    }
}

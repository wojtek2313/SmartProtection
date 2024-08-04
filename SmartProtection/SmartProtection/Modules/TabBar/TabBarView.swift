//
//  NavigationView.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 24/07/2024.
//

import SwiftUI
import SmartProtectionUI

struct TabBarView<Logic: TabBarLogicProtocol>: View {
    // MARK: - Private Properties
    
    @ObservedObject private var tabBarLogic: Logic
    private var dependencyFactory: DependenciesFacotry
    
    // MARK: - Initializers
    
    init(tabBarLogic: Logic, dependencyFactory: DependenciesFacotry = .shared) {
        self.tabBarLogic = tabBarLogic
        self.dependencyFactory = dependencyFactory
        bindSOSItemButton()
    }
    
    // MARK: - UI
    
    var body: some View {
        NavigationStack {
            GeometryReader { proxy in
                ZStack {
                    contentView
                    navigationBar(proxy: proxy)
                }
            }
            .navigationTitle("NAVIGATION_STACK_MAIN".localized)
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        switch tabBarLogic.selectedViewType {
        case .jobTracker: JobTrackerView(dependencyFactory: dependencyFactory)
        case .settings: SettingsView(dependencyFactory: dependencyFactory)
        }
    }
    
    private func navigationBar(proxy: GeometryProxy) -> some View {
        VStack { Spacer() }
        .safeAreaInset(edge: .bottom) {
            SPTabView(
                jobTrackerActionHandler: tabBarLogic.jobTrackerActionHandler,
                sosActionHandler: tabBarLogic.sosActionHandler,
                settingsActionHandler: tabBarLogic.settingsActionHandler,
                proxy: proxy
            )
            .background(.white)
        }
    }
    
    // MARK: - Private Methods
    
    private func bindSOSItemButton() {
        tabBarLogic.injectSOSAction {
            print("SOS")
        }
    }
}

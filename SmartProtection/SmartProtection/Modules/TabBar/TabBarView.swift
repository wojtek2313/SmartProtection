//
//  NavigationView.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 24/07/2024.
//

import Combine
import SwiftUI
import SmartProtectionUI

struct TabBarView<Logic: TabBarLogicProtocol>: View {
    // MARK: - Private Properties
    
    @ObservedObject private var tabBarLogic: Logic
    @State private var displaySOSSheet: Bool = false
    
    private var dependencyFactory: DependenciesFacotry
    
    // MARK: - Initializers
    
    init(tabBarLogic: Logic, dependencyFactory: DependenciesFacotry = .shared) {
        self.tabBarLogic = tabBarLogic
        self.dependencyFactory = dependencyFactory
    }
    
    // MARK: - UI
    
    var body: some View {
        GeometryReader { proxy in
            NavigationStack {
                ZStack {
                    contentView
                    navigationBar(proxy: proxy)
                }
                .fittedSheet(isPresented: $displaySOSSheet) {
                    SOSView(
                        isPresented: $displaySOSSheet,
                        proxy: proxy,
                        dependencyFactory: dependencyFactory
                    )
                }
                .navigationTitle("NAVIGATION_STACK_MAIN".localized)
            }
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
                sosActionHandler: { displaySOSSheet.toggle() },
                settingsActionHandler: tabBarLogic.settingsActionHandler,
                proxy: proxy
            )
            .background(.white)
        }
    }
}

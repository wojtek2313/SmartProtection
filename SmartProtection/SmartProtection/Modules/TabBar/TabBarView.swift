//
//  NavigationView.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 24/07/2024.
//

import SwiftUI
import SmartProtectionUI

struct TabBarView: View {
    // MARK: - Private Properties
    
    @ObservedObject private var tabBarLogic: TabBarLogic
    
    // MARK: - Initializers
    
    init(tabBarLogic: TabBarLogic) {
        self.tabBarLogic = tabBarLogic
        bindSOSItemButton()
    }
    
    // MARK: - UI
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                contentView
                navigationBar(proxy: proxy)
            }
        }
    }
    
    @ViewBuilder
    private var contentView: some View {
        switch tabBarLogic.selectedViewType {
        case .jobTracker: JobTrackerView()
        case .settings: SettingsView()
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
        }
    }
    
    // MARK: - Private Methods
    
    private func bindSOSItemButton() {
        tabBarLogic.injectSOSAction {
            print("SOS")
        }
    }
}

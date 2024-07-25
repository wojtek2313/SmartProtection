//
//  TabBarLogic.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 25/07/2024.
//

import SwiftUI

public class TabBarLogic: ObservableObject {
    // MARK: - Private Properties
    
    @Published private var tabBar: TabBarProtocol
    
    // MARK: - Public Properties
    
    var selectedViewType: TabBar.SelectedViewType {
        tabBar.selectedViewType
    }
    
    public func injectSOSAction(onSOSItemPressed: @escaping () -> Void) {
        tabBar.onSOSItemPressed = onSOSItemPressed
    }
    
    // MARK: - Initializers
    
    public init(tabBar: TabBarProtocol) {
        self.tabBar = tabBar
    }
    
    // MARK: - Public Methods
    
    public func jobTrackerActionHandler() {
        tabBar.jobTrackerActionHandler()
    }
    
    public func sosActionHandler() {
        tabBar.sosActionHandler()
    }
    
    public func settingsActionHandler() {
        tabBar.settingsActionHandler()
    }
}

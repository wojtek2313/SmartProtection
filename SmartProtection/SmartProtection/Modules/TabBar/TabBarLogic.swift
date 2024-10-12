//
//  TabBarLogic.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 25/07/2024.
//

import Combine
import SwiftUI

public protocol TabBarLogicProtocol: ObservableObject {
    var selectedViewType: TabBar.SelectedViewType { get }
    
    func jobTrackerActionHandler()
    func settingsActionHandler()
}

public class TabBarLogic: TabBarLogicProtocol {
    // MARK: - Private Properties
    
    @Published private var tabBar: TabBarProtocol
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Public Properties
    
    public var selectedViewType: TabBar.SelectedViewType {
        tabBar.selectedViewType
    }
    
    // MARK: - Initializers
    
    public init(tabBar: TabBarProtocol) {
        self.tabBar = tabBar
    }
    
    // MARK: - Public Methods
    
    public func jobTrackerActionHandler() {
        tabBar.jobTrackerActionHandler()
    }
    
    public func settingsActionHandler() {
        tabBar.settingsActionHandler()
    }
}

//
//  TabBarMock.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 26/07/2024.
//

import Foundation
@testable import SmartProtection

class TabBarMock: TabBarProtocol {
    // MARK: - Private Properties
    
    private var _selectedViewType: TabBar.SelectedViewType
    
    // MARK: - Public Properties
    
    public var selectedViewType: SmartProtection.TabBar.SelectedViewType {
        _selectedViewType
    }
    
    public var jobTrackerActionHandled = false
    public var sosActionHandled = false
    public var settingsActionHandled = false
    
    public var onSOSItemPressed: (() -> Void)?
    
    // MARK: - Initializers
    
    public init(selectedViewType: TabBar.SelectedViewType) {
        self._selectedViewType = selectedViewType
    }
    
    // MARK: - Public Methods
    
    public  func jobTrackerActionHandler() {
        self._selectedViewType = .jobTracker
        jobTrackerActionHandled = true
    }
    
    public func sosActionHandler() {
        sosActionHandled = true
        onSOSItemPressed?()
    }
    
    public func settingsActionHandler() {
        self._selectedViewType = .settings
        settingsActionHandled = true
    }
}

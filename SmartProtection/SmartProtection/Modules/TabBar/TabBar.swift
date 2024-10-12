//
//  TabBar.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 25/07/2024.
//

import Combine
import Foundation

public protocol TabBarProtocol {
    var selectedViewType: TabBar.SelectedViewType { get }
    
    mutating func jobTrackerActionHandler()
    mutating func settingsActionHandler()
}

public struct TabBar: TabBarProtocol {
    // MARK: - Private Properties
    
    private var _selectedViewType: SelectedViewType
    private var _sosShouldPresent = CurrentValueSubject<Bool, Never>(false)
    
    // MARK: - Public Properties
    
    public var selectedViewType: SelectedViewType {
        _selectedViewType
    }
    
    // MARK: - Initializers
    
    public init(selectedViewType: SelectedViewType) {
        self._selectedViewType = selectedViewType
    }
    
    // MARK: - Public Methods
    
    public mutating func jobTrackerActionHandler() {
        _selectedViewType = .jobTracker
    }
    
    public mutating func settingsActionHandler() {
        _selectedViewType = .settings
    }
    
    // MARK: - Model
    
    public enum SelectedViewType {
        case jobTracker, settings
    }
}

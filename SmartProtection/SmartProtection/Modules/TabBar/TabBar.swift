//
//  TabBar.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 25/07/2024.
//

import Foundation

public protocol TabBarProtocol {
    var selectedViewType: TabBar.SelectedViewType { get }
    var onSOSItemPressed: (() -> Void)? { get set }
    
    mutating func jobTrackerActionHandler()
    mutating func sosActionHandler()
    mutating func settingsActionHandler()
}

public struct TabBar: TabBarProtocol {
    // MARK: - Private Properties
    
    private var _selectedViewType: SelectedViewType
    
    // MARK: - Public Properties
    
    public var selectedViewType: SelectedViewType {
        _selectedViewType
    }
    
    public var onSOSItemPressed: (() -> Void)?
    
    // MARK: - Initializers
    
    init(selectedViewType: SelectedViewType) {
        self._selectedViewType = selectedViewType
    }
    
    // MARK: - Public Methods
    
    public mutating func jobTrackerActionHandler() {
        _selectedViewType = .jobTracker
    }
    
    public mutating func sosActionHandler() {
        onSOSItemPressed?()
    }
    
    public mutating func settingsActionHandler() {
        _selectedViewType = .settings
    }
    
    // MARK: - Model
    
    public enum SelectedViewType {
        case jobTracker, settings
    }
}

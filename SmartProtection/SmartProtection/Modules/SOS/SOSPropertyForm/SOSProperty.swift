//
//  SOSProperty.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 31/10/2024.
//

import Foundation

public protocol SOSPropertyProtocol {
    var reason: String? { get }
    var item: String? { get }
    var isExchangeNeeded: Bool? { get }
    
    mutating func update(reason: String)
    mutating func update(item: String)
    mutating func update(isExchangeNeeded: Bool)
}

public struct SOSProperty: SOSPropertyProtocol {
    // MARK: - Private Properties
    
    public private(set) var reason: String? = nil
    public private(set) var item: String? = nil
    public private(set) var isExchangeNeeded: Bool? = nil
    
    // MARK: - Public Methods
    
    public mutating func update(reason: String) {
        self.reason = reason
    }
    
    public mutating func update(item: String) {
        self.item = item
    }
    
    public mutating func update(isExchangeNeeded: Bool) {
        self.isExchangeNeeded = isExchangeNeeded
    }
}

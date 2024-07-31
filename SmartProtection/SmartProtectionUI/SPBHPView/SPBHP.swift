//
//  SPBHP.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 30/07/2024.
//

import Foundation

public struct SPBHP {
    // MARK: - Private Properties
    
    private var _items: [Item]
    
    // MARK: - Public Properties
    
    public var items: [Item] { _items }
    
    public var areItemsWerable: Bool {
        var isVerable = true
        _items.forEach {
            if !$0.isWerable {
                isVerable = false
            }
        }
        return isVerable
    }
    
    // MARK: - Initializers
    
    public init(items: [Item]) {
        self._items = items
    }
    
    // MARK: - Public Methods
    
    public mutating func addItem(_ item: Item) {
        _items.append(item)
    }
    
    // MARK: - Model
    
    public struct Item {
        // MARK: - Public Properties
        
        public var name: String
        public var isWerable: Bool
        
        // MARK: - Public Initializers
        
        public init(name: String, isWerable: Bool) {
            self.name = name
            self.isWerable = isWerable
        }
    }
}

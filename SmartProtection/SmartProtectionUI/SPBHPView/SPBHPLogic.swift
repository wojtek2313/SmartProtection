//
//  SPBHPLogic.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 30/07/2024.
//

import SwiftUI

public class SPBHPLogic: ObservableObject {
    // MARK: - Private Properties
    
    @Published private var spbhp: SPBHP
    
    // MARK: - Public Properties
    
    public var areItemsWerable: Bool {
        spbhp.areItemsWerable
    }
    
    // MARK: - Initializers
    
    public init(spbhp: SPBHP) {
        self.spbhp = spbhp
    }
    
    // MARK: - Public Methods
    
    public func addItem(_ item: SPBHP.Item) {
        spbhp.addItem(item)
    }
}

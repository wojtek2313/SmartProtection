//
//  SOSPropertyLogic.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 31/10/2024.
//

import Foundation

public class SOSPropertyLogic: ObservableObject {
    // MARK: - Public Properties
    
    @Published public var selectedWhatHasHappendItem: WhatHasHappendItem?
    @Published public var selectedWhatIsUnderFire: UnderFireItem?
    @Published public var selectedExchangeItem: ExchangeItem?
    @Published public var isLoading: Bool = false
    @Published public var closeModal: Bool = false
    
    public var model: SOSProperty { sosProperty }
    
    // MARK: - Private Properties
    
    @Published private var sosProperty: SOSProperty
    
    // MARK: - Initializers
    
    init(sosProperty: SOSProperty) {
        self.sosProperty = sosProperty
    }
    
    // MARK: - Public Methods
    
    func update(reason: String) {
        sosProperty.update(reason: reason)
    }
    
    func update(item: String) {
        sosProperty.update(item: item)
    }
    
    func update(exchange: Bool) {
        sosProperty.update(isExchangeNeeded: exchange)
    }
    
    func sendEvent() {
        isLoading = true
        Task { @MainActor in
            try await Task.sleep(nanoseconds: 2_000_000_000)
            isLoading = false
            closeModal = true
        }
    }
}

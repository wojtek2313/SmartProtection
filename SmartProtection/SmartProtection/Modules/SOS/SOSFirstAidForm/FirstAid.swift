//
//  FirstAid.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 17/10/2024.
//

import Foundation

public protocol FirstAidProtocol {
    var sample: FirstAid.SAMPLE { get }
    
    mutating func update(isConscious: Bool)
    mutating func update(reason: String)
    mutating func update(symptoms: String)
    mutating func update(lastLunch: String)
    mutating func update(isSober: String)
}

public struct FirstAid: FirstAidProtocol {
    // MARK: - Public Properties
    
    public var sample: SAMPLE { _sample }
    
    // MARK: - Private Properties
    
    private var _sample: SAMPLE
    
    // MARK: - Initializers
    
    init(sample: SAMPLE) {
        self._sample = sample
    }
    
    // MARK: - Public Methods
    
    public mutating func update(reason: String) {
        _sample.reason = reason
    }
    
    public mutating func update(isConscious: Bool) {
        _sample.isConscious = isConscious
    }
    
    public mutating func update(symptoms: String) {
        _sample.symptoms = symptoms
    }
    
    public mutating func update(lastLunch: String) {
        _sample.lastLunch = lastLunch
    }
    
    public mutating func update(isSober: String) {
        _sample.isSober = isSober
    }
    
    // MARK: - Models
    
    public struct SAMPLE {
        var isConscious: Bool? = nil
        var reason: String? = nil
        var symptoms: String? = nil
        var lastLunch: String? = nil
        var isSober: String? = nil
    }
}

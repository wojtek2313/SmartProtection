//
//  FirstAidLogic.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 17/10/2024.
//

import Foundation

public class FirstAidLogic: ObservableObject {
    // MARK: - Public Properties
    
    @Published public var selectedConsciousItem: ConsciousItem?
    @Published public var selectedReasonItem: ReasonItem?
    @Published public var selectedSymptomItem: SymptomItem?
    @Published public var selectedLastLunch: LunchItem?
    @Published public var selectedSoberItem: SoberItem?
    @Published public var isLoading: Bool = false
    @Published public var closeModal: Bool = false
    
    public var sample: FirstAid.SAMPLE {
        firstAid.sample
    }
    
    // MARK: - Private Properties
    
    @Published private var firstAid: FirstAidProtocol
    
    // MARK: - Initializers
    
    init(firstAid: FirstAidProtocol) {
        self.firstAid = firstAid
    }
    
    // MARK: - Public Methods
    
    func update(isConscious: Bool) {
        firstAid.update(isConscious: isConscious)
    }
    
    func update(reason: String) {
        firstAid.update(reason: reason)
    }
    
    func update(symptoms: String) {
        firstAid.update(symptoms: symptoms)
    }
    
    func update(afterLunch: String) {
        firstAid.update(lastLunch: afterLunch)
    }
    
    func update(isSober: String) {
        firstAid.update(isSober: isSober)
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

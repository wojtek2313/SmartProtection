//
//  SPProgressLogic.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 28/07/2024.
//

import Foundation
import SwiftUI
import Combine

public protocol SPProgressLogicProtocol: ObservableObject {
    var progress: CGFloat { get }
    var time: String { get }
}

public class SPProgressLogic: SPProgressLogicProtocol {
    // MARK: - Private Properties
    
    @Published private var _progress: SPProgressProtocol
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Public Properties
    
    public var progress: CGFloat { CGFloat(_progress.progress) }
    
    public var time: String { _progress.time }
    
    // MARK: - Initializers
    
    public init(progress: SPProgressProtocol) {
        self._progress = progress
        let cancellable = modulatedPublisher(interval: 1)
            .sink(receiveValue: { _ in
                withAnimation {
                    self.objectWillChange.send()
                }
            })
        cancellable.store(in: &cancellables)
    }
    
    // MARK: - Private Methods
    
    private func modulatedPublisher(interval: TimeInterval) -> AnyPublisher<Date, Never> {
        let timerBuffer = Timer
            .publish(every: interval, on: .main, in: .common)
            .autoconnect()
        
        return timerBuffer
            .eraseToAnyPublisher()
    }
}

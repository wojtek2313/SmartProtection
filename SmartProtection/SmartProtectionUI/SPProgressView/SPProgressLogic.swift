//
//  SPProgressLogic.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 28/07/2024.
//

import Foundation
import SwiftUI

public class SPProgressLogic {
    // MARK: - Private Properties
    
    private var _progress: SPProgress
    
    // MARK: - Public Properties
    
    public let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect()
    
    public var progress: Float { _progress.progress }
    
    public var time: String { _progress.time }
    
    // MARK: - Initializers
    
    public init(progress: SPProgress) {
        self._progress = progress
    }
}

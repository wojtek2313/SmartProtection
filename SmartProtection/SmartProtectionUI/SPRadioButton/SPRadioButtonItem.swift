//
//  SPRadioButtonItem.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 18/10/2024.
//

import Foundation

public protocol SPRadioButtonItem: Identifiable, Equatable, CaseIterable {
    var title: String { get }
    var id: String { get }
}

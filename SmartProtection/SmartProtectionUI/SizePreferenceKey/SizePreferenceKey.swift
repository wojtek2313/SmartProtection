//
//  SizePreferenceKey.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 10/10/2024.
//

import SwiftUI

public struct SizePreferenceKey: PreferenceKey {
    public static var defaultValue: CGSize = .zero
    public static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

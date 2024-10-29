//
//  EnvironmentValues+Ext.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 10/10/2024.
//

import SwiftUI

public extension EnvironmentValues {
    var scrollViewProxy: ScrollViewProxy? {
        get { self[ScrollViewProxyKey.self] }
        set { self[ScrollViewProxyKey.self] = newValue }
    }
}

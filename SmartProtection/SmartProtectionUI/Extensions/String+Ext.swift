//
//  String+Ext.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 14/07/2024.
//

import Foundation

internal extension String {
    var localized: String { return NSLocalizedString(self, comment: "") }
}

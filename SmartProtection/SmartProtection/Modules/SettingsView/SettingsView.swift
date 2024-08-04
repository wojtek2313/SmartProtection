//
//  SettingsView.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 25/07/2024.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - Private Properties
    
    private var dependencyFactory: DependenciesFacotry
    
    // MARK: - Initializers
    
    init(dependencyFactory: DependenciesFacotry) {
        self.dependencyFactory = dependencyFactory
    }
    
    // MARK: - UI
    
    var body: some View {
        List {
            Text("Settings")
        }
    }
}

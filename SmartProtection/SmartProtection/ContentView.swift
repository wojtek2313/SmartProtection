//
//  ContentView.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 14/07/2024.
//

import SwiftUI
import SmartProtectionUI

struct ContentView: View {

    var body: some View {
        VStack {
            SPTextField(type: .name)
            SPTextField(type: .password)
            SPButton(type: .next) {
                
            }
        }
    }
}

//
//  SOSForm.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 13/10/2024.
//

import SwiftUI
import SmartProtectionUI

struct SOSForm: View {
    // MARK: - Private Properties
    
    private var router: Router
    @Binding private var isPresented: Bool
    
    // MARK: - Initializers
    
    init(router: Router, isPresented: Binding<Bool>) {
        self.router = router
        self._isPresented = isPresented
    }
    
    // MARK: - UI
    
    var body: some View {
        RouterView(router: router) {
            SOSIntroductionForm(isPresented: $isPresented)
        }
    }
}

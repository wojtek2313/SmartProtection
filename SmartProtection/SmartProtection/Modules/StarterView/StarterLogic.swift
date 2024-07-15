//
//  StarterLogic.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 15/07/2024.
//

import SwiftUI

class StarterLogic: ObservableObject {
    @Published public var type: StarterViewType = .register(type: .personalData)
    @Published public var selectionIndex = 0
    
    public func toggleRegisterInputLayout(_ type: RegistrationViewType) {
        withAnimation(.easeInOut) {
            switch type {
            case .personalData, .companyData: selectionIndex += 1
            case .password: break
            }
        }
    }
    
    public func presentForgotPassword() {
        withAnimation(.easeInOut) {
            self.type = .forgotPassword(type: .login)
        }
    }
}

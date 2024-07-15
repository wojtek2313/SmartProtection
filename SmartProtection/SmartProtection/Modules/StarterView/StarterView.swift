//
//  StarterView.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 14/07/2024.
//

import SwiftUI
import SmartProtectionUI

struct StarterView: View {
    // MARK: - Private Properties
    
    @State private var type: StarterViewType = .register(type: .personalData)
    @State private var selectionIndex = 0

    // MARK: - UI
    
    var body: some View {
        container
    }
    
    private var container: AnyView {
        switch type {
        case .login: return AnyView(loginBody)
        case .register(_): return AnyView(registerBody)
        case .forgotPassword(_): return AnyView(resetPasswordBody)
        }
    }
    
    private var loginBody: some View {
        VStack {
            SPHeaderIcon(type: .login)
            Spacer()
            SPPageView { createSpViewContent(with: type).tag(StarterViewType.login.tag) }
            Spacer()
            Spacer()
        }
    }
    
    private var registerBody: some View {
        VStack {
            SPHeaderIcon(type: .register)
            Spacer()
            SPPageView(selectionIndex: $selectionIndex) {
                createSpViewContent(with: .register(type: .personalData)).tag(RegistrationViewType.personalData.tag)
                createSpViewContent(with: .register(type: .companyData)).tag(RegistrationViewType.companyData.tag)
                createSpViewContent(with: .register(type: .password)).tag(RegistrationViewType.password.tag)
            }
            Spacer()
            Spacer()
        }
    }
    
    private var resetPasswordBody: some View {
        VStack {
            SPHeaderIcon(type: .chagePassword)
            Spacer()
            SPPageView { createSpViewContent(with: type).tag(ForgotPasswordViewType.password) }
            Spacer()
            Spacer()
        }
    }
    
    private func createSpViewContent(with type: StarterViewType) -> some View {
        VStack {
            createInputLayout(type: type)
            SPButton(type: type.spButtonType) {
                switch type {
                case .login, .forgotPassword(_):
                    break
                case .register(let type):
                    toggleRegisterInputLayout(type)
                }
            }
        }
    }
    
    @ViewBuilder
    private func createInputLayout(type: StarterViewType) -> some View {
        VStack(alignment: .trailing) {
            SPTextField(type: type.textfieldTypes.upperTextFieldType)
            if let bottomTextFieldType = type.textfieldTypes.bottomTextFieldType {
                SPTextField(type: bottomTextFieldType)
            }
            Button {
                presentForgotPassword()
            } label: {
                Text("REGISTRATION_VIEW_FORGOT_PASSWORD".localized)
                    .foregroundColor(.spBlue)
                    .font(.custom(Constants.Font.font, fixedSize: Constants.Font.size))
                    .padding([.trailing])
            }
            .opacity(type == .login ? 1 : 0)
        }
    }
    
    // MARK: - Private Methods
    
    private func toggleRegisterInputLayout(_ type: RegistrationViewType) {
        withAnimation(.easeInOut) {
            switch type {
            case .personalData, .companyData: selectionIndex += 1
            case .password: break
            }
        }
    }
    
    private func presentForgotPassword() {
        withAnimation(.easeInOut) {
            self.type = .forgotPassword(type: .login)
        }
    }
    
    // MARK: - Constants
    
    private struct Constants {
        struct Font {
            static let font = "Avenir Next Bolt"
            static let size = 10.0
        }
    }
}

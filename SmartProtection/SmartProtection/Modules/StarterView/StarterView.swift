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
    
    @ObservedObject private var logic: StarterLogic
    
    // MARK: - Initializers
    
    init(logic: StarterLogic) {
        self.logic = logic
    }

    // MARK: - UI
    
    var body: some View {
        container
    }
    
    private var container: AnyView {
        switch logic.type {
        case .login: return AnyView(createBody(for: .login))
        case .register(_): return AnyView(registerBody)
        case .forgotPassword(_): return AnyView(createBody(for: .register(type: .password)))
        }
    }
    
    private var registerBody: some View {
        VStack {
            SPHeaderIcon(type: .register)
            Spacer()
            SPPageView(selectionIndex: $logic.selectionIndex) {
                createSpViewContent(with: .register(type: .personalData)).tag(RegistrationViewType.personalData.tag)
                createSpViewContent(with: .register(type: .companyData)).tag(RegistrationViewType.companyData.tag)
                createSpViewContent(with: .register(type: .password)).tag(RegistrationViewType.password.tag)
            }
            Spacer()
            Spacer()
        }
    }
    
    private func createBody(for type: StarterViewType) -> some View {
        VStack {
            SPHeaderIcon(type: type.spHeaderIconType)
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
                    logic.toggleRegisterInputLayout(type)
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
                logic.presentForgotPassword()
            } label: {
                Text("REGISTRATION_VIEW_FORGOT_PASSWORD".localized)
                    .foregroundColor(.spBlue)
                    .font(.custom(Constants.Font.font, fixedSize: Constants.Font.size))
                    .padding([.trailing])
            }
            .opacity(type == .login ? 1 : 0)
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

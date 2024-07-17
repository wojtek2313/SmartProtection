//
//  WelcomeView.swift
//  SmartProtection
//
//  Created by Wojciech Kulas on 14/07/2024.
//

import SwiftUI
import SmartProtectionUI

struct WelcomeView: View {
    // MARK: - Private Properties
    
    @ObservedObject private var welcomeLogic: WelcomeLogic
    
    // MARK: - Initializers
    
    init(welcome: WelcomeLogic) {
        self.welcomeLogic = welcome
    }

    // MARK: - UI
    
    var body: some View {
        container
    }
    
    private var container: AnyView {
        switch welcomeLogic.currentWelcomeViewType {
        case .login: return AnyView(createBody(for: .login))
        case .register(_): return AnyView(registerBody)
        case .forgotPassword(_): return AnyView(createBody(for: .register(type: .password)))
        }
    }
    
    private var registerBody: some View {
        VStack {
            SPHeaderIcon(type: .register)
            Spacer()
            SPPageView(selectionIndex: welcomeLogic.indexOfCurrentlySelectedView) {
                createSpViewContent(with: .register(type: .personalData)).tag(RegistrationViewType.personalData.tag)
                createSpViewContent(with: .register(type: .companyData)).tag(RegistrationViewType.companyData.tag)
                createSpViewContent(with: .register(type: .password)).tag(RegistrationViewType.password.tag)
            }
            Spacer()
            Spacer()
        }
    }
    
    private func createBody(for type: WelcomeViewType) -> some View {
        VStack {
            SPHeaderIcon(type: type.spHeaderIconType)
            Spacer()
            SPPageView(selectionIndex: welcomeLogic.indexOfCurrentlySelectedView) { createSpViewContent(with: type).tag(ForgotPasswordViewType.password) }
            Spacer()
            Spacer()
        }
    }
    
    private func createSpViewContent(with type: WelcomeViewType) -> some View {
        VStack {
            createInputLayout(type: type)
            SPButton(type: type.spButtonType, enabled: welcomeLogic.areCurrentViewDataValid) {
                switch type {
                case .login, .forgotPassword(_):
                    break
                case .register(_):
                    withAnimation(.easeInOut) { welcomeLogic.presentNextViewAtTheHierarchy(currentViewType: type) }
                }
            }
        }
    }
    
    @ViewBuilder
    private func createInputLayout(type: WelcomeViewType) -> some View {
        VStack(alignment: .trailing) {
            createTextField(of: type.textfieldTypes.upperTextFieldType)
            if let bottomTextFieldType = type.textfieldTypes.bottomTextFieldType {
                createTextField(of: bottomTextFieldType)
            }
            Button {
                welcomeLogic.presentView(at: .forgotPassword(type: .login))
            } label: {
                Text("REGISTRATION_VIEW_FORGOT_PASSWORD".localized)
                    .foregroundColor(.spBlue)
                    .font(.custom(Constants.Font.font, fixedSize: Constants.Font.size))
                    .padding([.trailing])
            }
            .opacity(type == .login ? 1 : 0)
        }
    }
    
    private func createTextField(
        of type: SPTextFieldType,
        isTextFieldRequired isRequired: Bool = true
    ) -> some View {
        SPTextField(type: type, isRequired: isRequired) { welcomeLogic.insertUserData(with: $0, fromTextFieldWithType: type) }
    }
    
    // MARK: - Constants
    
    private struct Constants {
        struct Font {
            static let font = "Avenir Next Bolt"
            static let size = 10.0
        }
    }
}

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
            SPPageView { createSpViewContent(with: type) }
            Spacer()
            Spacer()
        }
    }
    
    private var registerBody: some View {
        VStack {
            SPHeaderIcon(type: .register)
            Spacer()
            SPPageView {
                createSpViewContent(with: .register(type: .personalData))
                createSpViewContent(with: .register(type: .companyData))
                createSpViewContent(with: .register(type: .password))
            }
            Spacer()
            Spacer()
        }
    }
    
    private var resetPasswordBody: some View {
        VStack {
            SPHeaderIcon(type: .chagePassword)
            Spacer()
            SPPageView { createSpViewContent(with: type) }
            Spacer()
            Spacer()
        }
    }
    
    private func createSpViewContent(with type: StarterViewType) -> some View {
        VStack {
            createInputLayout(type: type)
            SPButton(type: type.spButtonType) {
                
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

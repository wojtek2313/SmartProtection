//
//  SPTextField.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 14/07/2024.
//

import SwiftUI

public struct SPTextField: View {
    // MARK: - Public Properties
    
    public let type: SPTextFieldType
    @State public var inputText: String = ""
    
    // MARK: - Private Properties
    
    @State private var isInputHidden: Bool
    
    // MARK: - Initializers
    
    public init(type: SPTextFieldType) {
        self.type = type
        self.isInputHidden = type.inputHideable
    }
    
    // MARK: - UI
    
    public var body: some View {
        VStack(alignment: .leading, spacing: Constants.Layout.spaceBetweenTitleAndTextField) {
            Text(type.title.localized)
            baseOfTextField
        }
        .font(.custom(Constants.Fonts.Names.avenirNextMedium, fixedSize: Constants.Fonts.Size.small))
        .textFieldStyle(.roundedBorder)
        .disableAutocorrection(true)
        .accentColor(.gray)
        .foregroundColor(.gray)
        .padding([.leading, .trailing])
    }
    
    @ViewBuilder
    private var baseOfTextField: some View {
        if type.inputHideable {
            passwordTextField
        } else {
            TextField(type.placeholder, text: $inputText)
                .onAppear { UITextField.appearance().clearButtonMode = .whileEditing }
        }
    }
    
    @ViewBuilder
    private var passwordTextField: some View {
        ZStack(alignment: .trailing) {
            if isInputHidden {
                SecureField(type.placeholder, text: $inputText)
            } else {
                TextField(type.placeholder, text: $inputText)
            }
            hideInputButton
        }
    }
    
    private var hideInputButton: some View {
        Button { isInputHidden.toggle() } label: {
            Image(isInputHidden ? Constants.Images.openEyeIconName : Constants.Images.closedEyeIconName)
                .resizable()
                .scaledToFit()
                .frame(
                    width: Constants.Layout.Image.width,
                    height: Constants.Layout.Image.height,
                    alignment: .trailing
                )
        }
        .padding(.trailing, Constants.Layout.medium)
    }
    
    // MARK: - Constants
    
    private struct Constants {
        
        /// Fonts
        struct Fonts {
            
            /// Names
            struct Names {
                static let avenirNextMedium = "Avenir Next Medium"
            }
            
            /// Size
            struct Size {
                static let small = 10.0
            }
        }
        
        /// Images
        struct Images {
            static let openEyeIconName = "eye"
            static let closedEyeIconName = "blind"
        }
        
        /// Layout
        struct Layout {
            static let spaceBetweenTitleAndTextField: CGFloat = 5
            static let medium = 25.0
            
            // Image
            struct Image {
                static let width: CGFloat = 20
                static let height: CGFloat = 20
            }
        }
    }
}

//
//  SPTextField.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 14/07/2024.
//

import SwiftUI

public struct SPTextField: View {
    // MARK: - Public Properties
    @State private var isInputValid = true
    
    // MARK: - Private Properties
    
    private let type: SPTextFieldType
    private let isRequired: Bool
    private var onChange: (String) -> Void
    
    @State private var isInputHidden: Bool
    @State private var inputText: String = ""
    
    // MARK: - Initializers
    
    public init(type: SPTextFieldType, isRequired: Bool = false, onChange: @escaping (String) -> Void) {
        self.type = type
        self.isInputHidden = type.inputHideable
        self.isRequired = isRequired
        self.onChange = onChange
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
        .foregroundColor(isInputValid ? .gray : .red)
        .padding([.leading, .trailing])
        .onTapGesture { isInputValid = true }
    }
    
    @ViewBuilder
    private var baseOfTextField: some View {
        if type.inputHideable {
            passwordTextField
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(isInputValid ? .gray : .red))
                .onChange(of: inputText) { self.onChange($0) }
        } else {
            TextField(type.placeholder, text: $inputText)
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(isInputValid ? .gray : .red))
                .onAppear {
                    UITextField.appearance().clearButtonMode = .whileEditing }
                .onSubmit { validate() }
                .onChange(of: inputText) { onChange($0) }
        }
    }
    
    @ViewBuilder
    private var passwordTextField: some View {
        ZStack(alignment: .trailing) {
            if isInputHidden {
                SecureField(type.placeholder, text: $inputText)
                    .onSubmit {  validate() }
            } else {
                TextField(type.placeholder, text: $inputText)
                    .onSubmit { validate() }
            }
            hideInputButton
        }
    }
    
    private var hideInputButton: some View {
        Button { isInputHidden.toggle() } label: {
            Image(systemName: isInputHidden ? Constants.Images.openEyeIconName : Constants.Images.closedEyeIconName)
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
    
    // MARK: - Public Methods
    
    private func validate() {
        guard isRequired else { return }
        isInputValid = !inputText.isEmpty
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
            static let closedEyeIconName = "eye.slash"
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

//
//  SPButton.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 14/07/2024.
//

import SwiftUI

public struct SPButton: View {
    // MARK: - Private Properties
    
    private let type: SPButtonType
    private let action: () -> Void
    
    // MARK: - Initializers
    
    public init(type: SPButtonType, action: @escaping () -> Void) {
        self.type = type
        self.action = action
    }
    
    // MARK: - UI
    
    public var body: some View {
        Button(action: action) { buttonContent }
            .padding()
    }
    
    private var title: some View {
        Text(type.title)
            .foregroundColor(.white)
            .font(.custom(Constants.Font.font, fixedSize: Constants.Font.size))
    }
    
    private var buttonContent: some View {
        RoundedRectangle(cornerRadius: Constants.cornerRadius)
            .foregroundColor(type.color)
            .frame(height: Constants.height)
            .overlay {
                title
            }
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let cornerRadius = 5.0
        static let height = 30.0
        
        struct Font {
            static let font = "Avenir Next Bolt"
            static let size = 10.0
        }
    }
}

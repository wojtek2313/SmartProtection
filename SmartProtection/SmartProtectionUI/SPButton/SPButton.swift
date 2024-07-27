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
    private let enabled: Bool
    private let action: () -> Void
    private var height: CGFloat?
    private var titleFont: Font?
    
    // MARK: - Initializers
    
    public init(
        type: SPButtonType,
        enabled: Bool = true,
        height: CGFloat? = nil,
        titleFont: Font? = nil,
        action: @escaping () -> Void
    ) {
        self.type = type
        self.enabled = enabled
        self.height = height
        self.titleFont = titleFont
        self.action = action
    }
    
    // MARK: - UI
    
    public var body: some View {
        Button(action: action) { buttonContent }
            .padding()
            .disabled(!enabled)
    }
    
    private var title: some View {
        Text(type.title)
            .foregroundColor(.white)
            .font(titleFont ?? .custom(Constants.Font.font, fixedSize: Constants.Font.size))
    }
    
    private var buttonContent: some View {
        RoundedRectangle(cornerRadius: Constants.cornerRadius)
            .foregroundColor(enabled ? type.color : .gray)
            .frame(height: height ?? Constants.height)
            .overlay {
                title
            }
            .shadow(
                color: .black,
                radius: Constants.Shadow.radius,
                x: Constants.Shadow.xPosition,
                y: Constants.Shadow.yPosition
            )
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let cornerRadius = 5.0
        static let height = 30.0
        
        /// Fonts
        struct Font {
            static let font = "Avenir Next Bolt"
            static let size = 10.0
        }
        
        /// Shadow
        struct Shadow {
            static let radius = 3.0
            static let xPosition = 0.0
            static let yPosition = 1.0
        }
    }
}

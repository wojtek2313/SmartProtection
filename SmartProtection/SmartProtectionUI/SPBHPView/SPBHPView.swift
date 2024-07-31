//
//  SPBHPView.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 30/07/2024.
//

import SwiftUI

public struct SPBHPView: View {
    // MARK: - Private Properties
    
    @ObservedObject private var logic: SPBHPLogic
    
    // MARK: - Initializers
    
    public init(logic: SPBHPLogic) {
        self.logic = logic
    }
    
    // MARK: - UI
    
    public var body: some View {
        RoundedRectangle(cornerRadius: Constants.RoundedRectangle.cornerRadius)
            .foregroundColor(Constants.RoundedRectangle.foregroundColor)
            .frame(height: 180)
            .shadow(
                color: .black,
                radius: Constants.Shadow.radius,
                x: Constants.Shadow.xPosition,
                y: Constants.Shadow.yPosition
            )
            .overlay(content)
            .padding()
            .padding(.horizontal, 45)
    }
    
    private var content: some View {
        VStack {
            Text(logic.areItemsWerable ? "SP_BHP_POSITIVE_TEXT".localized : "SP_BHP_NEGATIVE_TEXT".localized)
            Image(systemName: logic.areItemsWerable ? "checkmark.diamond.fill" : "xmark.diamond.fill")
                .resizable()
                .scaledToFit()
                .frame(
                    width: Constants.Image.width,
                    height: Constants.Image.height,
                    alignment: .trailing
                )
                .foregroundColor(logic.areItemsWerable ? .green : .red)
            Text(logic.areItemsWerable ? "SP_BHP_POSITIVE_SUBTITLE".localized : "SP_BHP_NEGATIVE_SUBTITLE".localized)
        }
        .font(.custom(Constants.Font.fontMedium, size: Constants.Font.small))
        .multilineTextAlignment(.center)
        .padding()
    }
    
    // MARK: - Constants
    
    private struct Constants {
        /// Rounded Rectangle
        struct RoundedRectangle {
            static let cornerRadius: CGFloat = 20.0
            static let foregroundColor: Color = .init(hex: "EBEBEB")
        }
        
        /// Shadow
        struct Shadow {
            static let radius = 3.0
            static let xPosition = 0.0
            static let yPosition = 1.0
        }
        
        /// Font
        struct Font {
            static let fontMedium = "Avenir Next Regular"
            static let small = 15.0
        }
        
        /// Image
        struct Image {
            static let width: CGFloat = 40
            static let height: CGFloat = 40
        }
    }
}

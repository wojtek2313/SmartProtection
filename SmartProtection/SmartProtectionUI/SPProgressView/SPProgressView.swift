//
//  SPProgressView.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 28/07/2024.
//

import SwiftUI

public struct SPProgressView: View {
    // MARK: - Private Properties
    
    @ObservedObject private var logic: SPProgressLogic
    
    // MARK: - Initializers
    
    public init(logic: SPProgressLogic) {
        self.logic = logic
    }
    
    // MARK: - UI
    
    public var body: some View {
        RoundedRectangle(cornerRadius: Constants.RoundedRectangle.cornerRadius)
            .foregroundColor(Constants.RoundedRectangle.foregroundColor)
            .frame(height: 400)
            .shadow(
                color: .black,
                radius: Constants.Shadow.radius,
                x: Constants.Shadow.xPosition,
                y: Constants.Shadow.yPosition
            )
            .overlay(content)

    }
    
    private var content: some View {
        VStack(alignment: .leading) {
            Text("SP_PROGRESS_VIEW".localized)
                .font(.subheadline)
                .foregroundColor(.black)
            
            VStack {
                circleProgress
                    .frame(width: 280, height: 280)
                    .padding()
            }
        }
    }
    
    var circleProgress: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: Constants.Circle.lineWidth)
                .foregroundColor(.white)
            
            Circle()
                .trim(from: Constants.Circle.startingPointTrim, to: logic.progress)
                .stroke(style: StrokeStyle(lineWidth: Constants.Circle.lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(.spBlue)
                .rotationEffect(Angle(degrees: Constants.Circle.degrees))
                .animation(.easeInOut, value: logic.progress)
            
            Text("\(logic.time)")
                .font(.headline)
        }
    }
    
    // MARK: - Constants
    
    private struct Constants {
        /// Circle
        struct Circle {
            static let lineWidth: CGFloat = 20
            static let opacity: Double = 0.1
            static let startingPointTrim: CGFloat = 0.0
            static let degrees: CGFloat = 270.0
        }
        
        /// Rounded Rectangle
        struct RoundedRectangle {
            static let cornerRadius: CGFloat = 38.0
            static let foregroundColor: Color = .init(hex: "EBEBEB")
        }
        
        /// Shadow
        struct Shadow {
            static let radius = 3.0
            static let xPosition = 0.0
            static let yPosition = 1.0
        }
    }
}

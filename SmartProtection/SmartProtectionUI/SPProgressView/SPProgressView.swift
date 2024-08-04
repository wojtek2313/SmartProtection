//
//  SPProgressView.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 28/07/2024.
//

import SwiftUI

public struct SPProgressView<Logic: SPProgressLogicProtocol>: View {
    // MARK: - Private Properties
    
    @ObservedObject private var logic: Logic
    
    // MARK: - Initializers
    
    public init(logic: Logic) {
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
            static var lineWidth: CGFloat { 20 }
            static var opacity: Double { 0.1 }
            static var startingPointTrim: CGFloat { 0.0 }
            static var degrees: CGFloat { 270.0 }
        }
        
        /// Rounded Rectangle
        struct RoundedRectangle {
            static var cornerRadius: CGFloat { 38.0 }
            static var foregroundColor: Color { .init(hex: "EBEBEB") }
        }
        
        /// Shadow
        struct Shadow {
            static var radius: Double { 3.0 }
            static var xPosition: Double { 0.0 }
            static var yPosition: Double { 1.0 }
        }
    }
}

//
//  SPHeaderIcon.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 15/07/2024.
//

import SwiftUI

public struct SPHeaderIcon: View {
    // MARK: - Private Properties
    private let type: SPHeaderIconType
    
    // MARK: - Initializers
    public init(type: SPHeaderIconType) {
        self.type = type
    }
    
    // MARK: - UI
    public var body: some View {
        VStack {
            Text(type.title).padding(.top)
            icon
                .foregroundColor(.white)
            Text(type.subtitle)
        }
        .font(.custom(Constants.Fonts.Names.avenirNextBold, fixedSize: Constants.Fonts.Size.small))
    }
    
    private var icon: some View {
        Circle()
            .frame(
                width: Constants.Circle.Frame.width,
                height: Constants.Circle.Frame.height,
                alignment: .center
            )
            .shadow(
                color: .black,
                radius: Constants.Circle.Frame.radius,
                x: Constants.Circle.Frame.positionX,
                y: Constants.Circle.Frame.positionY
            )
            .overlay {
                type.icon
                    .resizable()
                    .frame(
                        width: type == .chagePassword ? Constants.Circle.Icon.chagePasswordWidth : Constants.Circle.Icon.width,
                        height: type == .chagePassword ? Constants.Circle.Icon.chagePasswordHeight : Constants.Circle.Icon.height,
                        alignment: .center
                    )
            }
    }
    
    // MARK: - Constants
    
    struct Constants {
        
        /// Fonts
        struct Fonts {
            
            /// Names
            struct Names {
                static let avenirNextBold = "Avenir Next Medium"
            }
            
            /// Size
            struct Size {
                static let small = 10.0
            }
        }
        
        /// Circle
        struct Circle {
            
            /// Frame
            struct Frame {
                static let radius = 3.0
                static let positionX = 0.0
                static let positionY = 2.0
                static let width = 55.0
                static let height = 55.0
            }
            
            /// Icon
            struct Icon {
                static let width = 21.0
                static let height = 24.0
                
                static let chagePasswordWidth = 42.0
                static let chagePasswordHeight = 6.0
            }
        }
    }
}

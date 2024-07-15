//
//  SPPageView.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 15/07/2024.
//

import SwiftUI

public struct SPPageView<Content: View>: View {
    // MARK: - Private Properties
    
    private let content: () -> Content
    
    // MARK: - Initiailizers
    
    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    // MARK: - UI
    
    public var body: some View {
        TabView {
            content()
                .padding()
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(
            minHeight: 169,
            idealHeight: 169,
            maxHeight: 243,
            alignment: .center
        )
        .background(.white)
        .cornerRadius(6.0, antialiased: false)
        .shadow(color: .black, radius: 4, x: 0, y: 2)
        .padding()
    }
}

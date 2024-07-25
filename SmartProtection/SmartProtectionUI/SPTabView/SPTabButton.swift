//
//  SPTabButton.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 24/07/2024.
//

import SwiftUI

internal struct SPTabButton: View {
    var type: SPTabViewContentType
    var handleAction: () -> Void
    @Binding var isSelectedAtType: SPTabViewContentType
    
    var body: some View {
        Button { handleAction() } label: {
            Label {} icon: {
                Image(systemName: type.systemImage)
                    .resizable()
                    .frame(
                        width: type != .sos ? Constants.smallWidth : Constants.bigWidth,
                        height: type != .sos ? Constants.smallWidth : Constants.bigWidth
                    )
                    
            }
            .foregroundColor(isSelectedAtType == type ? .black : type.foregroundColor)
            .padding()
        }
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static let smallWidth: CGFloat = 30
        static let bigWidth: CGFloat = 45
    }
}

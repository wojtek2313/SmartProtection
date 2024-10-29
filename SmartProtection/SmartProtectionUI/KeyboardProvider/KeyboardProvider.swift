//
//  KeyboardProvider.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 10/10/2024.
//

import SwiftUI

struct KeyboardProvider: ViewModifier {
    var keyboardHeight: Binding<CGFloat>
    
    func body(content: Content) -> some View {
        content
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { notification in
                guard let userInfo = notification.userInfo,
                      let keyboardRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                keyboardHeight.wrappedValue = keyboardRect.height
            }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)) { _ in
                keyboardHeight.wrappedValue = 0
            }
    }
}

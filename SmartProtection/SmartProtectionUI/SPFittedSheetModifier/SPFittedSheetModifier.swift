//
//  SPFittedSheetModifier.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 10/10/2024.
//

import SwiftUI

struct Dummy: Identifiable {
    let id = "Dummy"
}

public struct SPFittedSheetModifier<Item: Identifiable, ItemContent: View>: ViewModifier {
    // MARK: - Public Properties
    
    @Binding var item: Item?
    let onDismiss: () -> Void
    let itemContent: (Item) -> ItemContent
    
    // MARK: - Private Properties
    
    @State private var height: CGFloat = .zero
    @State private var keyboardHeight: CGFloat = 0
    
    // MARK: - UI
    
    public func body(content: Content) -> some View {
        content
            .sheet(item: $item, onDismiss: onDismiss) { item in
                ScrollViewReader { proxy in
                    ScrollView {
                        itemContent(item)
                            .storeHeigh(in: $height)
                            .environment(\.scrollViewProxy, proxy)
                    }
                }
                .presentationDetents([.height(height - keyboardHeight)])
                .presentationDragIndicator(.hidden)
                .keyboardHeight($keyboardHeight)
            }
    }
}

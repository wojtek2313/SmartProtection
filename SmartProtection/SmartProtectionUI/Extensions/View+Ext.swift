//
//  View+Ext.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 10/10/2024.
//

import SwiftUI

public extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self,value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
    
    func storeHeigh(in binding: Binding<CGFloat>) -> some View {
        readSize { binding.wrappedValue = $0.height }
    }
    
    func keyboardHeight(_ state: Binding<CGFloat>) -> some View {
        modifier(KeyboardProvider(keyboardHeight: state))
    }
    
    func fittedSheet<Item: Identifiable>(item: Binding<Item?>,
                                         onDismiss: @escaping () -> Void = {},
                                         @ViewBuilder content: @escaping (Item) -> some View) -> some View {
        modifier(SPFittedSheetModifier(item: item, onDismiss: onDismiss, itemContent: content))
    }
    
    func fittedSheet(isPresented item: Binding<Bool>,
                     onDismiss: @escaping () -> Void = {},
                     @ViewBuilder content: @escaping () -> some View) -> some View {
        let dummyItem: Binding<Dummy?> = .init(get: { item.wrappedValue ? Dummy() : nil },
                                               set: { item.wrappedValue = $0 != nil ? true : false })
        let fittedSheetModifier = SPFittedSheetModifier(item: dummyItem, onDismiss: onDismiss, itemContent: { _ in content() })
        return modifier(fittedSheetModifier)
    }
}

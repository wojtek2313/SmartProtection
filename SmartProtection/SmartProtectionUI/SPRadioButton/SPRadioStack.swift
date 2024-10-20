//
//  SPRadioStack.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 18/10/2024.
//

import SwiftUI

public struct SPRadioStack<Item: SPRadioButtonItem>: View {
    // MARK: - Private Properties
    
    private let items: [Item]
    @Binding private var selectedItem: Item?
    
    // MARK: - Initializers
    
    public init(selectedItem: Binding<Item?>) {
        self.items = Item.allCases.map { $0 }
        self._selectedItem = selectedItem
    }
    
    
    // MARK: - UI
    
    public var body: some View {
        ScrollView {
            VStack {
                ForEach(items) { item in
                    SPRadioButton(item: item, selectedItem: $selectedItem, didSelectItem: { selected(item) })
                }
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func selected(_ item: Item) {
        guard selectedItem != item else { return }
        selectedItem = item
    }
}

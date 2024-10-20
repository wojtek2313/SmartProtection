//
//  SPRadioButton.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 18/10/2024.
//

import SwiftUI

public struct SPRadioButton<Item: SPRadioButtonItem>: View {
    // MARK: - Private Properties
    
    private let item: Item
    @Binding private var selectedItem: Item?
    private let didSelectItem: () -> Void
    
    // MARK: - Initializers
    
    public init(item: Item, selectedItem: Binding<Item?>, didSelectItem: @escaping () -> Void) {
        self.item = item
        self._selectedItem = selectedItem
        self.didSelectItem = didSelectItem
    }
    
    // MARK: - UI
    
    public var body: some View {
        Button { didSelectItem() } label: {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: selectedItem == item ? "largecircle.fill.circle" : "circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.spBlue)
                    .frame(width: Constants.width, height: Constants.height)
                Text(item.title)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
        }
    }
    
    // MARK: - Constants
    
    private struct Constants {
        static var width: CGFloat { 18 }
        static var height: CGFloat { 18 }
    }
}

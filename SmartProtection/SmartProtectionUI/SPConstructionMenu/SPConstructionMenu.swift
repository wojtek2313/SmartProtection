//
//  SPConstructionMenu.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 30/07/2024.
//

import SwiftUI

public struct SPConstructionMenu: View {
    // MARK: - Private Properties
    
    @State private var showPopover = false
    private var constructionName: String
    
    // MARK: - Initializers
    
    public init(constructionName name: String) {
        self.constructionName = name
    }
    
    // MARK: - UI
    
    public var body: some View {
        constructionButton
            .popover(isPresented: $showPopover) {
                Text("Content")
                    .font(.headline)
                    .padding()
            }
    }
    
    private var constructionButton: some View {
        Button { showPopover.toggle() } label: {
            HStack {
                Text("SP_CONSTRUCTION_MENU_TITLE".localized)
                    .font(.title)
                    .padding(.trailing)
                Text(constructionName)
                    .font(.title3)
                    .padding(.horizontal)
                Spacer()
                Image(systemName: "menucard.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: Constants.Image.width,
                        height: Constants.Image.height,
                        alignment: .trailing
                    )
                    .padding(.horizontal)
            }
            .padding()
            .foregroundColor(.black)
        }
    }
    
    // MARK: - Constants
    
    private struct Constants {
        /// Image
        struct Image {
            static let width: CGFloat = 21
            static let height: CGFloat = 21
        }
    }
}

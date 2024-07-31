//
//  SPTabView.swift
//  SmartProtectionUI
//
//  Created by Wojciech Kulas on 24/07/2024.
//

import SwiftUI

public struct SPTabView: View {
    // MARK: - Public Properties
    
    public var jobTrackerActionHandler: () -> Void
    public var sosActionHandler: () -> Void
    public var settingsActionHandler: () -> Void
    
    // MARK: - Private Properties
    
    private var proxy: GeometryProxy
    
    @State private var isSelectedAtType: SPTabViewContentType
    
    // MARK: - Initializers
    
    public init(
                jobTrackerActionHandler: @escaping () -> Void,
                sosActionHandler: @escaping () -> Void,
                settingsActionHandler: @escaping () -> Void,
                proxy: GeometryProxy,
                isSelectedAtType: SPTabViewContentType = .jobTracker
    ) {
        self.jobTrackerActionHandler = jobTrackerActionHandler
        self.sosActionHandler = sosActionHandler
        self.settingsActionHandler = settingsActionHandler
        self.proxy = proxy
        self._isSelectedAtType = .init(initialValue: isSelectedAtType)
    }
    
    // MARK: - UI
    
    public var body: some View {
        navigationButtons
            .padding()
            .background(createBackground())
    }
    
    // MARK: - Private Properties
    
    private func createBackground() -> some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .frame(width: proxy.size.width - widthOffset, height: proxy.size.width * heightOffset)
            .foregroundColor(backgorundColor)
    }
    
    private var navigationButtons: some View {
        HStack {
            SPTabButton(
                type: .jobTracker,
                handleAction: {
                    isSelectedAtType = .jobTracker
                    jobTrackerActionHandler()
                },
                isSelectedAtType: $isSelectedAtType
            )
            Spacer()
            SPTabButton(
                type: .sos,
                handleAction: sosActionHandler,
                isSelectedAtType: $isSelectedAtType
            )
            Spacer()
            SPTabButton(
                type: .userSettings,
                handleAction: {
                    isSelectedAtType = .userSettings
                    settingsActionHandler()
                },
                isSelectedAtType: $isSelectedAtType
            )
        }
        .padding([.leading, .trailing])
    }
    
    // MARK: - Constants
    
    let cornerRadius: CGFloat = 35
    let backgorundColor: Color = .init(hex: "EBEBEB")
    let heightOffset: CGFloat = 0.25
    let widthOffset: CGFloat = 20
}

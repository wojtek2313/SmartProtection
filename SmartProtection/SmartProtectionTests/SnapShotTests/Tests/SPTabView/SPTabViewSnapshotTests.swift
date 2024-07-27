//
//  SPTabViewSnapshotTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 27/07/2024.
//

import XCTest
import SwiftUI
import SmartProtectionUI
import SnapshotTesting

final class SPTabViewSnapshotTests: XCTestCase {
    // MARK: - Private Properties
    
    private var type: SPTabViewContentType = .jobTracker
    private var spTabView: some View {
        GeometryReader { proxy in
            SPTabView(jobTrackerActionHandler: {}, sosActionHandler: {}, settingsActionHandler: {}, proxy: proxy, isSelectedAtType: self.type)
        }
    }
    
    private var view: UIView {
        UIHostingController(rootView: spTabView
            .frame(width: 400, height: 200)
            .padding()
        ).view
    }
    
    // MARK: - Tests
    
    func testSPTabViewWhenJobTrackerIsSelected() {
        type = .jobTracker
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPTabViewWhenSettingsIsSelected() {
        type = .userSettings
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
}

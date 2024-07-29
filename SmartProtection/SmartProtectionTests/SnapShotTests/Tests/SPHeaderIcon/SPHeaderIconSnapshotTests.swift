//
//  SPHeaderIconSnapshotTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 19/07/2024.
//

import XCTest
import SwiftUI
import SmartProtectionUI
import SnapshotTesting

final class SPHeaderIconSnapshotTests: XCTestCase {
    // MARK: - Tests
    
    func testSPHeaderIconWithRegisterIconType() {
        let headerIcon = SPHeaderIcon(type: .register)
        let view: UIView = UIHostingController(rootView: headerIcon).view
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }

    func testSPHeaderIconWithLoginIconType() {
        let headerIcon = SPHeaderIcon(type: .login)
        let view: UIView = UIHostingController(rootView: headerIcon).view
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPHeaderIconWithForgotPasswordIconType() {
        let headerIcon = SPHeaderIcon(type: .chagePassword)
        let view: UIView = UIHostingController(rootView: headerIcon).view
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
}

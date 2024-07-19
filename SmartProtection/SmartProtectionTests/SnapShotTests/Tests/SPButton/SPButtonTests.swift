//
//  SPButtonTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 19/07/2024.
//

import XCTest
import SwiftUI
import SmartProtectionUI
import SnapshotTesting

final class SPButtonTests: XCTestCase {
    // MARK: - Private Properties
    
    private var type: SPButtonType = .register
    
    private var enabled: Bool = true
    
    private var button: SPButton {
        SPButton(type: type, enabled: enabled, action: {})
    }
    
    private var view: UIView {
        UIHostingController(rootView: button
            .frame(width: 120, height: 30)
            .padding()
        ).view
    }
    
    // MARK: - Set Up
    
    override func setUp() {
        super.setUp()
        enabled = true
        type = .register
    }
    
    // MARK: - Tests
    
    func testSPButtonWhenEnabledAndOnRegisterType() {
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPButtonWhenDisabledAndOnRegisterType() {
        enabled = false
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPButtonWhenEnabledAndOnLoginType() {
        type = .login
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPButtonWhenDisabledAndOnLoginType() {
        type = .login
        enabled = false
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPButtonWhenEnabledAndOnNextType() {
        type = .next
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPButtonWhenDisabledAndOnNextType() {
        type = .next
        enabled = false
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPButtonWhenEnabledAndOnResetType() {
        type = .reset
        enabled = true
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPButtonWhenDisabledAndOnResetType() {
        type = .reset
        enabled = false
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPButtonWhenEnabledAndOnNewPasswordType() {
        type = .newPassword
        enabled = true
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPButtonWhenDisabledAndOnNewPasswordType() {
        type = .newPassword
        enabled = false
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
}

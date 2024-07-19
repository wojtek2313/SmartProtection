//
//  SPTextFieldSnapshotTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 19/07/2024.
//

import XCTest
import SwiftUI
import SmartProtectionUI
import SnapshotTesting

final class SPTextFieldSnapshotTests: XCTestCase {
    // MARK: - Private Properties
    
    private var type: SPTextFieldType = .login
    private var spTextField: SPTextField {
        SPTextField(type: type, isRequired: true) { value in }
    }
    
    private var view: UIView {
        UIHostingController(rootView: spTextField
            .frame(width: 200, height: 30)
            .padding()
        ).view
    }
    
    // MARK: - Set Up
    
    override func setUp() {
        super.setUp()
        type = .login
    }
    
    // MARK: - Tests
    
    /// Empty SP Text Fields
    func testSPTextFieldOnTypeLogin() {
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPTextFieldOnTypePassword() {
        type = .password
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPTextFieldOnTypeName() {
        type = .name
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPTextFieldOnTypeSurname() {
        type = .surname
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPTextFieldOnTypeCompany() {
        type = .company
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPTextFieldOnTypeMobile() {
        type = .mobile
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPTextFieldOnTypeNewPassword() {
        type = .newPassword
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPTextFieldOnTypeNewLogin() {
        type = .newLogin
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
}

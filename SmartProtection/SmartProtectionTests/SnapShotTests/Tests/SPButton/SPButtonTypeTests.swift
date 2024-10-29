//
//  SPButtonTypeTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 19/07/2024.
//

import XCTest
import SwiftUI
import SmartProtectionUI

final class SPButtonTypeTests: XCTestCase {
    // MARK: - Tests
    
    func testSPButtonTypeWhenSetToLogin() {
        let type = SPButtonType.login
        XCTAssertEqual(type.title, "SP_BUTTON_LOG_IN".localized)
        XCTAssertEqual(type.color, .spBlue)
    }
    
    func testSPButtonTypeWhenSetToNext() {
        let type = SPButtonType.next
        XCTAssertEqual(type.title, "SP_BUTTON_NEXT".localized)
        XCTAssertEqual(type.color, .spBlue)
    }
    
    func testSPButtonTypeWhenSetToReset() {
        let type = SPButtonType.reset
        XCTAssertEqual(type.title, "SP_BUTTON_RESET_PASSWORD".localized)
        XCTAssertEqual(type.color, .spBlue)
    }
    
    func testSPButtonTypeWhenSetToRegister() {
        let type = SPButtonType.register
        XCTAssertEqual(type.title, "SP_BUTTON_REGISTER".localized)
        XCTAssertEqual(type.color, .spBlue)
    }
    
    func testSPButtonTypeWhenSetToNewPassword() {
        let type = SPButtonType.newPassword
        XCTAssertEqual(type.title, "SP_BUTTON_SET_NEW_PASSWORD".localized)
        XCTAssertEqual(type.color, .spBlue)
    }
    
    func testSPButtonTypeWhenSetToDocuments() {
        let type = SPButtonType.documents
        XCTAssertEqual(type.title, "SP_BUTTON_DOCUMENTS".localized)
        XCTAssertEqual(type.color, .spBlue)
    }
    
    func testSPButtonTypeWhenSetToSOSForm() {
        let type = SPButtonType.sosForm
        XCTAssertEqual(type.title, "SP_BUTTON_SOS_FORM".localized)
        XCTAssertEqual(type.color, .red)
    }
}

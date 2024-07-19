//
//  SPHeaderIconTypeTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 19/07/2024.
//

import XCTest
import SmartProtectionUI
import SmartProtection
import SwiftUI

final class SPHeaderIconTypeTests: XCTestCase {
    // MARK: - Tests
    
    func testSPHeaderIconTypeWhenTypeIsSetToLogin() {
        let type = SPHeaderIconType.login
        XCTAssertEqual(type.icon, Image("log-in-icon"))
        XCTAssertEqual(type.title, "SP_HEADER_ICON_TITLE".localized)
        XCTAssertEqual(type.subtitle, "SP_HEADER_ICON_LOG_IN".localized)
    }
    
    func testSPHeaderIconTypeWhenTypeIsSetToRegister() {
        let type = SPHeaderIconType.register
        XCTAssertEqual(type.icon, Image("log-in-icon"))
        XCTAssertEqual(type.title, "SP_HEADER_ICON_TITLE".localized)
        XCTAssertEqual(type.subtitle, "SP_HEADER_ICON_REGISTER".localized)
    }
    
    func testSPHeaderIconTypeWhenTypeIsSetToChangePassword() {
        let type = SPHeaderIconType.chagePassword
        XCTAssertEqual(type.icon, Image("pass_icon"))
        XCTAssertEqual(type.title, "SP_HEADER_ICON_TITLE".localized)
        XCTAssertEqual(type.subtitle, "SP_HEADER_ICON_CHANGE_PASSWORD".localized)
    }
}

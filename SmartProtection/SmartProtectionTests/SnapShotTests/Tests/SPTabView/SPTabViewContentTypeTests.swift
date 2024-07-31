//
//  SPTabViewContentTypeTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 27/07/2024.
//

import XCTest
import SmartProtectionUI

final class SPTabViewContentTypeTests: XCTestCase {
    // MARK: - Tests
    
    func testJobTrackerType() {
        let type = SPTabViewContentType.jobTracker
        XCTAssertEqual(type.systemImage, "house.fill")
        XCTAssertEqual(type.foregroundColor, .gray)
        XCTAssertEqual(type.font, .title2)
    }
    
    func testSOSType() {
        let type = SPTabViewContentType.sos
        XCTAssertEqual(type.systemImage, "sos.circle.fill")
        XCTAssertEqual(type.foregroundColor, .red)
        XCTAssertEqual(type.font, .largeTitle)
    }
    
    func testJobUserSettingsType() {
        let type = SPTabViewContentType.userSettings
        XCTAssertEqual(type.systemImage, "gear")
        XCTAssertEqual(type.foregroundColor, .gray)
        XCTAssertEqual(type.font, .title2)
    }
}

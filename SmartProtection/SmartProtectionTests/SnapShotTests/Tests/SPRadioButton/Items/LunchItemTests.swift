//
//  LunchItemTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 29/10/2024.
//

import XCTest
@testable import SmartProtection

final class LunchItemTests: XCTestCase {
    // MARK: - Tests

    func testLunchItemWhenYesType() {
        var sut: LunchItem = .yes
        XCTAssertEqual(sut.title, "SP_YES".localized)
        XCTAssertEqual(sut.id, "0")
    }
    
    func testLunchItemWhenNoType() {
        var sut: LunchItem = .no
        XCTAssertEqual(sut.title, "SP_NO".localized)
        XCTAssertEqual(sut.id, "1")
    }
    
    func testLunchItemWhenDoNotKnowType() {
        var sut: LunchItem = .dontKnow
        XCTAssertEqual(sut.title, "SP_DONT_KNOW".localized)
        XCTAssertEqual(sut.id, "2")
    }

}

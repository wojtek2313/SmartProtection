//
//  ConsciousItemTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 25/10/2024.
//

import XCTest
@testable import SmartProtection

final class ConsciousItemTests: XCTestCase {
    // MARK: - Tests
    
    func testConsciousItemTitleForYesType() {
        let sut: ConsciousItem = .yes
        XCTAssertEqual(sut.title, "SP_YES".localized)
        XCTAssertEqual(sut.id, "0")
        XCTAssertTrue(sut.output)
    }
    
    func testConsciousItemTitleForNoType() {
        let sut: ConsciousItem = .no
        XCTAssertEqual(sut.title, "SP_NO".localized)
        XCTAssertEqual(sut.id, "1")
        XCTAssertFalse(sut.output)
    }
}

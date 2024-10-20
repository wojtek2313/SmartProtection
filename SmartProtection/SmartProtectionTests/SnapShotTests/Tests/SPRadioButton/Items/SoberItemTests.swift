//
//  SoberItemTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 29/10/2024.
//

import XCTest
@testable import SmartProtection

final class SoberItemTests: XCTestCase {
    // MARK: - Tests
    
    func testSoberItemWhenYesType() {
        let sut: SoberItem = .yes
        XCTAssertEqual(sut.title, "SP_YES".localized)
        XCTAssertEqual(sut.id, "0")
    }
    
    func testSoberItemWhenNoType() {
        let sut: SoberItem = .no
        XCTAssertEqual(sut.title, "SP_NO".localized)
        XCTAssertEqual(sut.id, "1")
    }
    
    func testSoberItemWhenDoNotKnowType() {
        let sut: SoberItem = .dontKnow
        XCTAssertEqual(sut.title, "SP_DONT_KNOW".localized)
        XCTAssertEqual(sut.id, "2")
    }
}

//
//  ReasonItemTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 25/10/2024.
//

import XCTest
@testable import SmartProtection

final class ReasonItemTests: XCTestCase {
    // MARK: - Tests
    
    func testTitleWhenFalldownAccident() {
        let sut: ReasonItem = .falldownAccident
        XCTAssertEqual(sut.title, "SOS_FIRST_AID_FALLDOWN".localized)
        XCTAssertEqual(sut.id, "0")
    }
    
    func testTitleWhenEquipmentAccident() {
        let sut: ReasonItem = .equipmentAccident
        XCTAssertEqual(sut.title, "SOS_FIRST_AID_EQUIPMENT".localized)
        XCTAssertEqual(sut.id, "1")
    }
    
    func testTitleWhenElectricityAccident() {
        let sut: ReasonItem = .electricityAccident
        XCTAssertEqual(sut.title, "SOS_FIRST_AID_ELECTRICITY".localized)
        XCTAssertEqual(sut.id, "2")
    }
    
    func testTitleWhenChemicalsAccident() {
        let sut: ReasonItem = .chemicalsAccident
        XCTAssertEqual(sut.title, "SOS_FIRST_AID_CHEMICALS".localized)
        XCTAssertEqual(sut.id, "3")
    }
    
    func testTitleWhenOthers() {
        let sut: ReasonItem = .others
        XCTAssertEqual(sut.title, "SP_OTHERS".localized)
        XCTAssertEqual(sut.id, "4")
    }
}

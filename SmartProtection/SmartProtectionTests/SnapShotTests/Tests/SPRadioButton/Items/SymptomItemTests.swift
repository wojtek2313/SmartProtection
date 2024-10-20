//
//  SymptomItemTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 29/10/2024.
//

import XCTest
@testable import SmartProtection

final class SymptomItemTests: XCTestCase {
    // MARK: - Tests
    
    func testSymptomItemForFracturesType() {
        let sut: SymptomItem = .fractures
        XCTAssertEqual(sut.title, "SOS_FIRST_AID_FRACTURES".localized)
        XCTAssertEqual(sut.id, "0")
    }
    
    func testSymptomItemForHeadacheType() {
        let sut: SymptomItem = .headache
        XCTAssertEqual(sut.title, "SOS_FIRST_AID_HEADACHE".localized)
        XCTAssertEqual(sut.id, "1")
    }
    
    func testSymptomItemForStomachacheType() {
        let sut: SymptomItem = .stomachache
        XCTAssertEqual(sut.title, "SOS_FIRST_AID_STOMACHACHE".localized)
        XCTAssertEqual(sut.id, "2")
    }
    
    func testSymptomItemForVomitsType() {
        let sut: SymptomItem = .vomits
        XCTAssertEqual(sut.title, "SOS_FIRST_AID_VOMITS".localized)
        XCTAssertEqual(sut.id, "3")
    }
    
    func testSymptomItemForSlurredSpeech() {
        let sut: SymptomItem = .slurredSpeech
        XCTAssertEqual(sut.title, "SOS_FIRST_AID_SLURRED_SPEECH".localized)
        XCTAssertEqual(sut.id, "4")
    }
    
    func testSymptomItemForGettingLost() {
        let sut: SymptomItem = .gettingLost
        XCTAssertEqual(sut.title, "SOS_FIRST_AID_GETTING_LOST".localized)
        XCTAssertEqual(sut.id, "5")
    }
    
    func testSymptomItemForOthers() {
        let sut: SymptomItem = .others
        XCTAssertEqual(sut.title, "SP_OTHERS".localized)
        XCTAssertEqual(sut.id, "6")
    }
}

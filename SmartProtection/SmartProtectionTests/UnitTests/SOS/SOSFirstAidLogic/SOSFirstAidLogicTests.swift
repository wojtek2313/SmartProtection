//
//  SOSFirstAidLogicTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 02/11/2024.
//

import XCTest
@testable import SmartProtection

final class SOSFirstAidLogicTests: XCTestCase {
    // MARK: - Private Properties
    
    private var sut: FirstAidLogic!
    
    // MARK: - Set Up
    
    override func setUp() {
        super.setUp()
        sut = FirstAidLogic(firstAid: FirstAid(sample: FirstAid.SAMPLE()))
    }
    
    // MARK: - Tear Down
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testUpdateConsciousWhenTrue() throws {
        sut.update(isConscious: true)
        let isConscious = try XCTUnwrap(sut.sample.isConscious)
        XCTAssertTrue(isConscious)
    }
    
    func testUpdateConsciousWhenFalse() throws {
        sut.update(isConscious: false)
        let isConscious = try XCTUnwrap(sut.sample.isConscious)
        XCTAssertFalse(isConscious)
    }
    
    func testUpdateReason() {
        sut.update(reason: Constants.Reason.reason)
        XCTAssertEqual(sut.sample.reason, Constants.Reason.reason)
    }
    
    func testUpdateSymptoms() {
        sut.update(symptoms: Constants.Symptoms.symptoms)
        XCTAssertEqual(sut.sample.symptoms, Constants.Symptoms.symptoms)
    }
    
    func testUpdateAfterLunch() {
        sut.update(afterLunch: Constants.AfterLunch.afterLunch)
        XCTAssertEqual(sut.sample.lastLunch, Constants.AfterLunch.afterLunch)
    }
    
    func testUpdateIsSober() {
        sut.update(isSober: Constants.IsSober.isSober)
        XCTAssertEqual(sut.sample.isSober, Constants.IsSober.isSober)
    }
    
    // MARK: - Constants
    
    private struct Constants {
        /// Reason
        struct Reason {
            static let reason = "Test"
        }
        
        /// Symptoms
        struct Symptoms {
            static let symptoms = "Test2"
        }
        
        /// After Lunch
        struct AfterLunch {
            static let afterLunch = "Test3"
        }
        
        /// Is Sober
        struct IsSober {
            static let isSober = "Test4"
        }
    }
}

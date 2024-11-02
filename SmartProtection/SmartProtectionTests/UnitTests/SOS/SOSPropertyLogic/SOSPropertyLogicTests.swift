//
//  SOSPropertyLogicTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 02/11/2024.
//

import XCTest
@testable import SmartProtection

final class SOSPropertyLogicTests: XCTestCase {
    // MARK: - Private Properties
    
    private var sut: SOSPropertyLogic!
    
    // MARK: - Set Up
    
    override func setUp() {
        super.setUp()
        sut = SOSPropertyLogic(sosProperty: .init())
    }
    
    // MARK: - Tear Down
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testUpdateReason() {
        sut.update(reason: Constants.Reason.reason)
        XCTAssertEqual(sut.model.reason, Constants.Reason.reason)
    }
    
    func testUpdateItem() {
        sut.update(item: Constants.Item.item)
        XCTAssertEqual(sut.model.item, Constants.Item.item)
    }
    
    func testUpdateExchangeWhenTrue() throws {
        sut.update(exchange: true)
        let isNeeded = try XCTUnwrap(sut.model.isExchangeNeeded)
        XCTAssertTrue(isNeeded)
    }
    
    func testUpdateExchangeWhenfalse() throws {
        sut.update(exchange: false)
        let isNeeded = try XCTUnwrap(sut.model.isExchangeNeeded)
        XCTAssertFalse(isNeeded)
    }
    
    // MARK: - Constants
    
    private struct Constants {
        /// Reason
        struct Reason {
            static let reason = "Test"
        }
        
        /// Item
        struct Item {
            static let item = "Test1"
        }
    }
}

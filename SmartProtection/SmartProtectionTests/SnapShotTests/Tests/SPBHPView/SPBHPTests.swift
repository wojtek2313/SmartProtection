//
//  SPBHPTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 31/07/2024.
//

import XCTest
import SmartProtectionUI

final class SPBHPTests: XCTestCase {
    // MARK: - Private Properties
    
    private var sut: SPBHP?
    
    // MARK: - Set Up
    
    override func setUp() {
        super.setUp()
        let items = [SPBHP.Item(name: "kask", isWerable: true)]
        sut = .init(items: items)
    }
    
    // MARK: - Tear Down
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    /// Are Items Werable
    func testAreItemsWerable() throws {
        var sut = try XCTUnwrap(sut, "System Under Test Wrongly Initialized")
        XCTAssertTrue(sut.areItemsWerable)
        
        sut.addItem(SPBHP.Item(name: "Buty", isWerable: false))
        XCTAssertFalse(sut.areItemsWerable)
    }
    
    /// Items
    /// Add Item
    func testItemsIncreasedWhenAddItemHappen() throws {
        var sut = try XCTUnwrap(sut, "System Under Test Wrongly Initialized")
        XCTAssertEqual(sut.items.count, 1)
        
        sut.addItem(SPBHP.Item(name: "Buty", isWerable: true))
        XCTAssertEqual(sut.items.count, 2)
    }
}

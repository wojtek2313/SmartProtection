//
//  SPProgressLogicTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 29/07/2024.
//

import XCTest
import SmartProtectionUI

final class SPProgressLogicTests: XCTestCase {
    // MARK: - Private Properties
    
    private var sut: SPProgressLogic?
    private var spProgress: SPProgress = .init(numberOfTotalDailyWorkHours: 8, timer: .init(startHour: Date())) {
        willSet {
            sut = .init(progress: newValue)
        }
    }
    
    // MARK: - Set Up
    
    override func setUp() {
        super.setUp()
        self.spProgress = .init(numberOfTotalDailyWorkHours: 8, timer: .init(startHour: Date()))
    }
    
    // MARK: - Tear Down
    
    override func tearDown() {
        self.sut = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    /// Progress
    ///
    /// when start hour is now
    func testProgressWhenStartHourIsNow() {
        XCTAssertEqual(sut?.progress, 0.0)
    }
    
    /// when start hour was 4 hours ago
    func testProgressWhenStartHourWasFourHoursBefore() {
        guard let date = Calendar.current.date(byAdding: .hour, value: -4, to: Date()) else {
            XCTFail("Test initialization failed!")
            return
        }
        spProgress = .init(numberOfTotalDailyWorkHours: 8, timer: .init(startHour: date))
        XCTAssertEqual(sut?.progress, 0.5)
    }
    
    /// Time
    func testTime() throws {
        var sut = try XCTUnwrap(sut, "Test initialization failed!")
        XCTAssertEqual(sut.time, "0h : 0min")
        
        guard let date = Calendar.current.date(byAdding: .hour, value: -4, to: Date()),
        let newDate = Calendar.current.date(byAdding: .minute, value: -30, to: date) else {
            XCTFail("Test initialization failed!")
            return
        }
        let progress = SPProgress(numberOfTotalDailyWorkHours: 8, timer: .init(startHour: newDate))
        sut = .init(progress: progress)
        var sut1 = try XCTUnwrap(sut, "Test initialization failed!")
        XCTAssertEqual(sut1.time, "4h : 30min")
    }
}

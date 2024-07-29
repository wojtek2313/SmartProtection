//
//  SPProgressTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 29/07/2024.
//

import XCTest
import SmartProtectionUI

final class SPProgressTests: XCTestCase {
    // MARK: - Private Properties
    
    private var sut: SPProgress?
    
    // MARK: - Tear Down
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    /// Progress
    ///
    /// When Number Of Total Daily Work Hours Is Eight H And One Already Pass Through
    func testProgressWhenNumberOfTotalDailyWorkHoursIsEightAndOneAlreadyPassThrough() {
        guard let date = Calendar.current.date(byAdding: .hour, value: -1, to: Date()) else {
            XCTFail("Test Initialization Failed!")
            return
        }
        sut = SPProgress(numberOfTotalDailyWorkHours: 8, timer: .init(startHour: date))
        
        XCTAssertEqual(sut?.progress, 1/8)
    }
    
    /// When Number Of Total Daily Work Hours Is Four H And One Already Pass Through
    func testProgressWhenNumberOfTotalDailyWorkHoursIsFourAndOneAlreadyPassThrough() {
        guard let date = Calendar.current.date(byAdding: .hour, value: -1, to: Date()) else {
            XCTFail("Test Initialization Failed!")
            return
        }
        sut = SPProgress(numberOfTotalDailyWorkHours: 4, timer: .init(startHour: date))
        
        XCTAssertEqual(sut?.progress, 1/4)
    }
    
    /// When Number Of Total Daily Work Hours Is Eight H And Two Already Pass Through
    func testProgressWhenNumberOfTotalDailyWorkHoursIsEightAndTwoAlreadyPassThrough() {
        guard let date = Calendar.current.date(byAdding: .hour, value: -2, to: Date()) else {
            XCTFail("Test Initialization Failed!")
            return
        }
        sut = SPProgress(numberOfTotalDailyWorkHours: 8, timer: .init(startHour: date))
        
        XCTAssertEqual(sut?.progress, 2/8)
    }
    
    /// Time
    ///
    /// When time is 1h 30min
    func testTimeWhenOneHourAndThirtyMinutesLeft() throws {
        guard let date = Calendar.current.date(byAdding: .hour, value: -1, to: Date()),
              let newDate = Calendar.current.date(byAdding: .minute, value: -30, to: date) else {
            XCTFail("Test Initialization Failed!")
            return
        }
        sut = SPProgress(numberOfTotalDailyWorkHours: 8, timer: .init(startHour: newDate))
        
        let sut = try XCTUnwrap(sut, "SUT initialization Failed")
        
        XCTAssertEqual(sut.time, "1h : 30min")
    }
    
    /// When time is 2h 30min
    func testTimeWhenTwoHoursAndThirtyMinutesLeft() throws {
        guard let date = Calendar.current.date(byAdding: .hour, value: -2, to: Date()),
              let newDate = Calendar.current.date(byAdding: .minute, value: -30, to: date) else {
            XCTFail("Test Initialization Failed!")
            return
        }
        sut = SPProgress(numberOfTotalDailyWorkHours: 8, timer: .init(startHour: newDate))
        
        let sut = try XCTUnwrap(sut, "SUT initialization Failed")
        
        XCTAssertEqual(sut.time, "2h : 30min")
    }
}

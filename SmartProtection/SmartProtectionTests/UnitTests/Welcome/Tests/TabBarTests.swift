//
//  TabBarTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 27/07/2024.
//

import XCTest
@testable import SmartProtection

final class TabBarTests: XCTestCase {
    // MARK: - Private Properties
    
    private var sut: TabBar?
    private var sosActionHasBeenHappened = false
    
    // MARK: - Tear Down
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    /// Selected View Type
    ///
    /// When On Init Is Job Tracker
    func testSelectedViewTypeWhenOnInitIsJobTracker() {
        sut = .init(selectedViewType: .jobTracker)
        XCTAssertEqual(sut?.selectedViewType, .jobTracker)
    }
    
    /// When On Init Is Settings
    func testSelectedViewTypeWhenOnInitIsSettings() {
        sut = .init(selectedViewType: .settings)
        XCTAssertEqual(sut?.selectedViewType, .settings)
    }
    
    /// Selected View Type
    ///
    /// When On Init Is Job Tracker And Settings Action Happened
    func testSelectedViewTypeWhenOnInitIsJobTrackerAndSettingsActionHappened() {
        sut = .init(selectedViewType: .jobTracker)
        sut?.settingsActionHandler()
        XCTAssertEqual(sut?.selectedViewType, .settings)
    }
    
    /// When On Init Is Settings And Job Tracker Action Happened
    func testSelectedViewTypeWhenOnInitIsSettingsAndJobTrackerActionHappened() {
        sut = .init(selectedViewType: .settings)
        sut?.jobTrackerActionHandler()
        XCTAssertEqual(sut?.selectedViewType, .jobTracker)
    }
}

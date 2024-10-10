//
//  TabBarLogicTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 26/07/2024.
//

import XCTest
@testable import SmartProtection

final class TabBarLogicTests: XCTestCase {
    // MARK: - Private Properties
    
    private var sut: TabBarLogic?
    private var tabBar: TabBarMock? {
        willSet {
            guard let tabBar = newValue else {
                return
            }
            sut = TabBarLogic(tabBar: tabBar)
        }
    }
    
    private var sosActionHasBeenInjected = false
    
    // MARK: - Tear Down
    
    override func tearDown() {
        sut = nil
        tabBar = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    /// Init
    ///
    /// For Job Tracker
    func testInitWhenTabBarProtocolIsAtTypeJobTracker() throws {
        XCTAssertNil(sut)
        tabBar = .init(selectedViewType: .jobTracker)
        let sut = try XCTUnwrap(sut)
        
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.selectedViewType, .jobTracker)
    }
    
    /// For Settings
    func testInitWhenTabBarProtocolIsAtTypeSettings() throws {
        XCTAssertNil(sut)
        tabBar = .init(selectedViewType: .settings)
        let sut = try XCTUnwrap(sut)
        
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.selectedViewType, .settings)
    }
    
    /// Selected View Type
    ///
    ///  With Job Tracker Action Handler
    func testSelectedViewTypeIsJobTrackerWhenAtSettingsJobTrackerActionHandled() throws {
        tabBar = TabBarMock(selectedViewType: .settings)
        let tabBar = try XCTUnwrap(tabBar)
        let sut = try XCTUnwrap(sut)
        
        XCTAssertEqual(sut.selectedViewType, .settings)
        XCTAssertFalse(tabBar.jobTrackerActionHandled)
        
        sut.jobTrackerActionHandler()
        
        XCTAssertEqual(sut.selectedViewType, .jobTracker)
        XCTAssertTrue(tabBar.jobTrackerActionHandled)
    }
    
    ///  With Settings Action Handler
    func testSelectedViewTypeIsSettingsWhenAtJobTrackerSettingsActionHandled() throws {
        tabBar = TabBarMock(selectedViewType: .jobTracker)
        let tabBar = try XCTUnwrap(tabBar)
        let sut = try XCTUnwrap(sut)
        
        XCTAssertEqual(sut.selectedViewType, .jobTracker)
        XCTAssertFalse(tabBar.settingsActionHandled)
        
        sut.settingsActionHandler()
        
        XCTAssertEqual(sut.selectedViewType, .settings)
        XCTAssertTrue(tabBar.settingsActionHandled)
    }
    
    ///  With SOS Action Handler
    ///
    ///  When Settings At Init
    func testSelectedViewTypeIsSettingsWhenAtSettingsSOSActionHandled() throws {
        tabBar = TabBarMock(selectedViewType: .settings)
        let tabBar = try XCTUnwrap(tabBar)
        let sut = try XCTUnwrap(sut)
        
        XCTAssertEqual(sut.selectedViewType, .settings)
        XCTAssertFalse(tabBar.sosActionHandled)
        
        sut.sosActionHandler()
        
        XCTAssertEqual(sut.selectedViewType, .settings)
        XCTAssertTrue(tabBar.sosActionHandled)
    }
    
    /// When Job Tracker At Init
    func testSelectedViewTypeIsJobTrackerWhenAtJobTrackerSOSActionHandled() throws {
        tabBar = TabBarMock(selectedViewType: .jobTracker)
        let tabBar = try XCTUnwrap(tabBar)
        let sut = try XCTUnwrap(sut)
        
        XCTAssertEqual(sut.selectedViewType, .jobTracker)
        XCTAssertFalse(tabBar.sosActionHandled)
        
        sut.sosActionHandler()
        
        XCTAssertEqual(sut.selectedViewType, .jobTracker)
        XCTAssertTrue(tabBar.sosActionHandled)
    }
    
    /// Inject SOS Action
    func testInjectSOSAction() throws {
        tabBar = TabBarMock(selectedViewType: .jobTracker)
        let sut = try XCTUnwrap(sut)
        
        sut.injectSOSAction(onSOSItemPressed: { [weak self] in
            self?.sosActionHasBeenInjected = true
        })
        
        XCTAssertFalse(sosActionHasBeenInjected)
        
        sut.sosActionHandler()
        
        XCTAssertTrue(sosActionHasBeenInjected)
    }
}

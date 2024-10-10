//
//  DependenciesFactoryTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 10/10/2024.
//

import XCTest
@testable import SmartProtection
import SmartProtectionUI

final class DependenciesFactoryTests: XCTestCase {
    // MARK: - Private Properties
    
    private var sut: DependenciesFacotry!
    
    // MARK: - Set Up
    
    override func setUp() {
        super.setUp()
        sut = DependenciesFacotry.shared
    }
    
    // MARK: - Tear Down
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - tests
    
    func testCreateTabBarLogicWhenCalledWithJobTrackerSelectedShouldReturnTabBarLogic() {
        let logic = sut.createTabBarLogic(selectedViewType: .jobTracker)
        XCTAssertTrue(logic is TabBarLogic)
    }
    
    func testCreateTabBarLogicWhenCalledWithSettingsSelectedShouldReturnTabBarLogic() {
        let logic = sut.createTabBarLogic(selectedViewType: .settings)
        XCTAssertTrue(logic is TabBarLogic)
    }
    
    func testCreateProgressWhenCalledShouldReturnProgressModel() {
        let progress = sut.createProgress(numberOfTotalDailyWorkHours: 8, startHour: .now)
        XCTAssertTrue(progress is SPProgressLogic)
    }
    
    func testCreateBHPLogicWhenCalledShouldReturnBHPLogicModel() {
        let bhp = sut.createBHPLogic(items: [.init(name: Constants.BHP.helmet, isWerable: true)])
        XCTAssertTrue(bhp is SPBHPLogic)
    }
    
    // MARK: - Constants
    
    private enum Constants {
        enum BHP {
            static let helmet = "Kask"
        }
    }
}

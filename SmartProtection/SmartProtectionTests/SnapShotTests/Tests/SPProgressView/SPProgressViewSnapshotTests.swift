//
//  SPProgressViewSnapshotTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 29/07/2024.
//

import XCTest
import SwiftUI
import SmartProtectionUI
import SnapshotTesting

final class SPProgressViewSnapshotTests: XCTestCase {
    // MARK: - Private Properties
    
    private var numberOfTotalWorkHours: Int = 8
    private var startHour: Date = Date() {
        didSet {
            self.spProgressView = createProgressView()
        }
    }
        
    private var spProgressView: SPProgressView<SPProgressLogic>?
    
    private var view: UIView {
        guard let spProgressView = spProgressView else {
            XCTFail("Tests wrongly initialized")
            return UIView()
        }
        return UIHostingController(rootView: spProgressView
            .frame(width: 450, height: 450)
            .padding()
        ).view
    }
    
    // MARK: - Tear Down
    
    override func tearDown() {
        spProgressView = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testSPProgressViewWhenStartTimeIsNow() {
        spProgressView = createProgressView()
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPProgressViewInitialisedOneHourAgo() {
        initializeTimer(hoursAgo: 1)
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPProgressViewInitialisedTwoHoursAgo() {
        initializeTimer(hoursAgo: 2)
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPProgressViewInitialisedThreeHoursAgo() {
        initializeTimer(hoursAgo: 3)
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPProgressViewInitialisedFourHoursAgo() {
        initializeTimer(hoursAgo: 4)
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPProgressViewInitialisedFiveHoursAgo() {
        initializeTimer(hoursAgo: 5)
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPProgressViewInitialisedSixHoursAgo() {
        initializeTimer(hoursAgo: 6)
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPProgressViewInitialisedSevenHoursAgo() {
        initializeTimer(hoursAgo: 7)
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPProgressViewInitialisedEightHoursAgo() {
        initializeTimer(hoursAgo: 8)
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    private func createProgressView() -> SPProgressView<SPProgressLogic> {
        let timer = SPProgress.Timer(startHour: startHour)
        let progress = SPProgress(numberOfTotalDailyWorkHours: numberOfTotalWorkHours, timer: timer)
        let logic = SPProgressLogic(progress: progress)
        return SPProgressView(logic: logic)
    }
    
    private func initializeTimer(hoursAgo hour: Int) {
        guard let date = Calendar.current.date(byAdding: .hour,
                                          value: -hour,
                                          to: Date())
        else {
            XCTFail("Setting time failed")
            return
        }
        self.startHour = date
    }
}

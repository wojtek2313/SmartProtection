//
//  SPCardViewTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 27/07/2024.
//

import XCTest
import SwiftUI
import SmartProtectionUI
import SnapshotTesting

final class SPCardViewTests: XCTestCase {
    // MARK: - Private Properties
    
    private var spCardView: SPCardView?
    
    private var view: UIView {
        UIHostingController(rootView: spCardView
            .frame(width: 400, height: 200)
            .padding()
        ).view
    }
    
    // MARK: - Set Up
    
    override func setUp() {
        super.setUp()
        spCardView = SPCardView(
            cardId: "TEST",
            name: "JAN",
            surname: "KOWALSKI",
            company: "TEST"
        )
    }
    
    // MARK: - Tear Down
    
    override func tearDown() {
        spCardView = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testSPCardView() {
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
}

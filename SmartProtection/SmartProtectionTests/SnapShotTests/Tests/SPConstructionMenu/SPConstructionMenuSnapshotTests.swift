//
//  SPConstructionMenuSnapshotTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 30/07/2024.
//

import XCTest
import SwiftUI
import SmartProtectionUI
import SnapshotTesting

final class SPConstructionMenuSnapshotTests: XCTestCase {
    // MARK: - Private Properties
    
    private var spConstructionMenu: SPConstructionMenu?
    
    private var view: UIView {
        guard let spConstructionMenu = spConstructionMenu else {
            XCTFail("Tests wrongly initialized")
            return UIView()
        }
        return UIHostingController(rootView: spConstructionMenu
            .frame(width: 450, height: 450)
            .padding()
        ).view
    }
    
    // MARK: - Tear Down
    
    override func tearDown() {
        spConstructionMenu = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    func testSPConstructionMenu() {
        spConstructionMenu = .init(constructionName: "Budowa")
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
}

//
//  SPBHPViewSnapshotTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 30/07/2024.
//

import XCTest
import SwiftUI
import SmartProtectionUI
import SnapshotTesting

final class SPBHPViewSnapshotTests: XCTestCase {
    // MARK: - Private Properties
    
    private var spBHPView: SPBHPView?
    
    private var view: UIView {
        guard let spConstructionMenu = spBHPView else {
            XCTFail("Tests wrongly initialized")
            return UIView()
        }
        return UIHostingController(rootView: spBHPView
            .frame(width: 450, height: 450)
            .padding()
        ).view
    }
    
    // MARK: - Tests
    
    func testSPBHPViewWhenEmployerDoesWearEquipment() {
        spBHPView = .init(logic: SPBHPLogic(spbhp: .init(items: [.init(name: "kask", isWerable: true)])))
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPBHPViewWhenEmployerDoesNotWearEquipment() {
        spBHPView = .init(logic: SPBHPLogic(spbhp: .init(items: [.init(name: "kask", isWerable: false)])))
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
}

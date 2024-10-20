//
//  SPRadioStackTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 29/10/2024.
//

import XCTest
import UIKit
import SwiftUI
import SmartProtectionUI
import SnapshotTesting
@testable import SmartProtection

final class SPRadioStackTests: XCTestCase {
    // MARK: - Private Properties
    
    private var spRadioStack: SPRadioStack<ConsciousItem>!
    private var view: UIView {
        return UIHostingController(rootView: spRadioStack
            .frame(width: 450, height: 450)
            .padding()
        ).view
    }
    
    // MARK: - Tests
    
    func testSPRadioStackSnapshotWhenYesSelected() {
        spRadioStack = .init(selectedItem: .constant(.yes))
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
    
    func testSPRadioStackSnapshotWhenNoSelected() {
        spRadioStack = .init(selectedItem: .constant(.no))
        assertSnapshot(of: view, as: .image(size: view.intrinsicContentSize))
    }
}

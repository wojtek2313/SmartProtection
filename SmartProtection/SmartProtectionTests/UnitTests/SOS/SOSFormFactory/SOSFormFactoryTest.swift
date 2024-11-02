//
//  SOSFormFactoryTest.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 02/11/2024.
//

import XCTest
@testable import SmartProtection

final class SOSFormFactoryTest: XCTestCase {
    // MARK: - Private Properties
    
    private var sut: SOSFormFactoryProtocol!
    
    // MARK: - Set Up
    
    override func setUp() {
        super.setUp()
        sut = SOSFormFactory()
    }
    
    // MARK: - Tests
    
    func testCreateSOSForm() {
        let sosForm = sut.createSOSForm(isPresented: .constant(true), dependencyFactory: .shared)
        XCTAssertTrue(sosForm is SOSForm)
    }

}

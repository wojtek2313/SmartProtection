//
//  SPTextFieldTypeTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 19/07/2024.
//

import XCTest
import SmartProtectionUI

final class SPTextFieldTypeTests: XCTestCase {
    // MARK: - Tests
    
    func testSPTextFieldTypeAtLogin() {
        let type = SPTextFieldType.login
        XCTAssertEqual(type.title, "SP_TEXT_FIELD_LOGIN".localized)
        XCTAssertEqual(type.placeholder, "SP_TEXT_FIELD_LOGIN_PLACEHOLDER".localized)
        XCTAssertEqual(type.inputHideable, false)
    }
    
    func testSPTextFieldTypeAtPassword() {
        let type = SPTextFieldType.password
        XCTAssertEqual(type.title, "SP_TEXT_FIELD_PASSWORD".localized)
        XCTAssertEqual(type.placeholder, "SP_TEXT_FIELD_PASSWORD_PLACEHOLDER".localized)
        XCTAssertEqual(type.inputHideable, true)
    }
    
    func testSPTextFieldTypeAtName() {
        let type = SPTextFieldType.name
        XCTAssertEqual(type.title, "SP_TEXT_FIELD_NAME".localized)
        XCTAssertEqual(type.placeholder, "SP_TEXT_FIELD_NAME_PLACEHOLDER".localized)
        XCTAssertEqual(type.inputHideable, false)
    }
    
    func testSPTextFieldTypeAtSurname() {
        let type = SPTextFieldType.surname
        XCTAssertEqual(type.title, "SP_TEXT_FIELD_SURNAME".localized)
        XCTAssertEqual(type.placeholder, "SP_TEXT_FIELD_SURNAME_PLACEHOLDER".localized)
        XCTAssertEqual(type.inputHideable, false)
    }
    
    func testSPTextFieldTypeAtCompany() {
        let type = SPTextFieldType.company
        XCTAssertEqual(type.title, "SP_TEXT_FIELD_COMPANY".localized)
        XCTAssertEqual(type.placeholder, "SP_TEXT_FIELD_COMPANY_PLACEHOLDER".localized)
        XCTAssertEqual(type.inputHideable, false)
    }
    
    func testSPTextFieldTypeAtMobile() {
        let type = SPTextFieldType.mobile
        XCTAssertEqual(type.title, "SP_TEXT_FIELD_MOBILE".localized)
        XCTAssertEqual(type.placeholder, "SP_TEXT_FIELD_MOBILE_PLACEHOLDER".localized)
        XCTAssertEqual(type.inputHideable, false)
    }
    
    func testSPTextFieldTypeAtNewLogin() {
        let type = SPTextFieldType.newLogin
        XCTAssertEqual(type.title, "SP_TEXT_FIELD_NEW_LOGIN".localized)
        XCTAssertEqual(type.placeholder, "SP_TEXT_FIELD_NEW_LOGIN_PLACEHOLDER".localized)
        XCTAssertEqual(type.inputHideable, false)
    }
    
    func testSPTextFieldTypeAtNewPassword() {
        let type = SPTextFieldType.newPassword
        XCTAssertEqual(type.title, "SP_TEXT_FIELD_NEW_PASSWORD".localized)
        XCTAssertEqual(type.placeholder, "SP_TEXT_FIELD_NEW_PASSWORD_PLACEHOLDER".localized)
        XCTAssertEqual(type.inputHideable, true)
    }
    
    func testSPTextFieldTypeAtWhatHasHappen() {
        let type = SPTextFieldType.whatHasHappend
        XCTAssertEqual(type.title, "SP_TEXT_FIELD_WHAT_HAS_HAPPEND".localized)
        XCTAssertEqual(type.placeholder, "SP_TEXT_FIELD_WHAT_HAS_HAPPEND".localized)
        XCTAssertEqual(type.inputHideable, false)
    }
    
    func testSPTextFieldTypeAtWhatItemUnderFire() {
        let type = SPTextFieldType.whatItemUnderFire
        XCTAssertEqual(type.title, "SP_TEXT_FIELD_WHAT_IS_UNDER_FIRE".localized)
        XCTAssertEqual(type.placeholder, "SP_TEXT_FIELD_WHAT_IS_UNDER_FIRE_PLACEHOLDER".localized)
        XCTAssertEqual(type.inputHideable, false)
    }
    
    func testSPTextFieldTypeAtWhatHasBeenRobbed() {
        let type = SPTextFieldType.whatHasBeenRobbed
        XCTAssertEqual(type.title, "SP_TEXT_FIELD_WHAT_HAS_BEEN_ROBBED".localized)
        XCTAssertEqual(type.placeholder, "SP_TEXT_FIELD_WHAT_HAS_BEEN_ROBBED".localized)
        XCTAssertEqual(type.inputHideable, false)
    }
    
    func testSPTextFieldTypeAtWhatIsUnderCollision() {
        let type = SPTextFieldType.whatIsUnderCollision
        XCTAssertEqual(type.title, "SP_TEXT_FIELD_WHAT_IS_UNDER_COLLISION".localized)
        XCTAssertEqual(type.placeholder, "SP_TEXT_FIELD_COLLISION_PLACEHOLDER".localized)
        XCTAssertEqual(type.inputHideable, false)
    }
    
    func testSPTextFieldTypeAtWhichMachineIsDamagged() {
        let type = SPTextFieldType.whichMachineIsUnderDamaged
        XCTAssertEqual(type.title, "SP_TEXT_FIELD_WHICH_MACHINE_IS_DAMAGED".localized)
        XCTAssertEqual(type.placeholder, "SP_TEXT_FIELD_WHAT_IS_UNDER_FIRE_PLACEHOLDER".localized)
        XCTAssertEqual(type.inputHideable, false)
    }
}

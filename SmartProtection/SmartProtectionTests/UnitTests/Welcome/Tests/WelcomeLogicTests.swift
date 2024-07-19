//
//  WelcomeLogicTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 19/07/2024.
//

import XCTest
import SmartProtection

final class WelcomeLogicTests: XCTestCase {
    // MARK: - Private Properties
    
    private var sut: WelcomeLogic?
    private var welcome: WelcomeProtocol? {
        willSet {
            guard let welcome = newValue else {
                return
            }
            sut = WelcomeLogic(welcome: welcome)
        }
    }
    
    // MARK: - Set Up
    
    override func setUp() {
        super.setUp()
        welcome = WelcomeMock(currentView: .register(type: .personalData))
    }
    
    // MARK: - Tear Down
    
    override func tearDown() {
        welcome = nil
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Tests
    
    /// Current Welcome View Type
    ///
    /// Registration View Type
    func testCurrentWelcomeViewTypeWhenRegisterPersonalDataIsAtInit() throws {
        let welcome = try XCTUnwrap(welcome)
        let sut = try XCTUnwrap(sut)
        XCTAssertEqual(sut.currentWelcomeViewType, welcome.currentView)
        XCTAssertEqual(sut.currentWelcomeViewType, .register(type: .personalData))
        XCTAssertEqual(sut.currentWelcomeViewType.tag, welcome.currentView.tag)
    }
    
    func testCurrentWelcomeViewTypeWhenRegisterCompanyDataIsAtInit() throws {
        welcome = WelcomeMock(currentView: .register(type: .companyData))
        let welcome = try XCTUnwrap(welcome)
        let sut = try XCTUnwrap(sut)
        XCTAssertEqual(sut.currentWelcomeViewType, welcome.currentView)
        XCTAssertEqual(sut.currentWelcomeViewType, .register(type: .companyData))
        XCTAssertEqual(sut.currentWelcomeViewType.tag, welcome.currentView.tag)
    }
    
    func testCurrentWelcomeViewTypeWhenRegisterPasswordDataIsAtInit() throws {
        welcome = WelcomeMock(currentView: .register(type: .password))
        let welcome = try XCTUnwrap(welcome)
        let sut = try XCTUnwrap(sut)
        XCTAssertEqual(sut.currentWelcomeViewType, welcome.currentView)
        XCTAssertEqual(sut.currentWelcomeViewType, .register(type: .password))
        XCTAssertEqual(sut.currentWelcomeViewType.tag, welcome.currentView.tag)
    }
    
    /// Login View Type
    func testCurrentWelcomeViewTypeWhenLoginIsAtInit() throws {
        welcome = WelcomeMock(currentView: .login)
        let welcome = try XCTUnwrap(welcome)
        let sut = try XCTUnwrap(sut)
        XCTAssertEqual(sut.currentWelcomeViewType, welcome.currentView)
        XCTAssertEqual(sut.currentWelcomeViewType, .login)
        XCTAssertEqual(sut.currentWelcomeViewType.tag, welcome.currentView.tag)
    }
    
    /// Forgot Password View Type
    func testCurrentWelcomeViewTypeWhenForgotPasswordLoginIsAtInit() throws {
        welcome = WelcomeMock(currentView: .forgotPassword(type: .login))
        let welcome = try XCTUnwrap(welcome)
        let sut = try XCTUnwrap(sut)
        XCTAssertEqual(sut.currentWelcomeViewType, welcome.currentView)
        XCTAssertEqual(sut.currentWelcomeViewType, .forgotPassword(type: .login))
        XCTAssertEqual(sut.currentWelcomeViewType.tag, welcome.currentView.tag)
    }
    
    func testCurrentWelcomeViewTypeWhenForgotPasswordPasswordIsAtInit() throws {
        welcome = WelcomeMock(currentView: .forgotPassword(type: .password))
        let welcome = try XCTUnwrap(welcome)
        let sut = try XCTUnwrap(sut)
        XCTAssertEqual(sut.currentWelcomeViewType, welcome.currentView)
        XCTAssertEqual(sut.currentWelcomeViewType, .forgotPassword(type: .password))
        XCTAssertEqual(sut.currentWelcomeViewType.tag, welcome.currentView.tag)
    }
    
    /// Index Of Currently Selected View
    ///
    /// Registration
    func testIndexOfCurrentlySelectedViewWhenRegisterPersonalDataIsAtInit() throws {
        let _ = try XCTUnwrap(welcome)
        let sut = try XCTUnwrap(sut)
        XCTAssertEqual(sut.indexOfCurrentlySelectedView, 0)
    }
    
    func testIndexOfCurrentlySelectedViewWhenRegisterCompanyDataIsAtInit() throws {
        welcome = WelcomeMock(currentView: .register(type: .companyData))
        let _ = try XCTUnwrap(welcome)
        let sut = try XCTUnwrap(sut)
        XCTAssertEqual(sut.indexOfCurrentlySelectedView, 1)
    }
    
    func testIndexOfCurrentlySelectedViewWhenRegisterPasswordDataIsAtInit() throws {
        welcome = WelcomeMock(currentView: .register(type: .password))
        let _ = try XCTUnwrap(welcome)
        let sut = try XCTUnwrap(sut)
        XCTAssertEqual(sut.indexOfCurrentlySelectedView, 2)
    }
    
    /// Login
    func testIndexOfCurrentlySelectedViewWhenLoginIsAtInit() throws {
        welcome = WelcomeMock(currentView: .login)
        let _ = try XCTUnwrap(welcome)
        let sut = try XCTUnwrap(sut)
        XCTAssertEqual(sut.indexOfCurrentlySelectedView, 0)
    }
    
    /// Forgot Password
    func testIndexOfCurrentlySelectedViewWhenForgotPasswordLoginIsAtInit() throws {
        welcome = WelcomeMock(currentView: .forgotPassword(type: .login))
        let _ = try XCTUnwrap(welcome)
        let sut = try XCTUnwrap(sut)
        XCTAssertEqual(sut.indexOfCurrentlySelectedView, 0)
    }
    
    func testIndexOfCurrentlySelectedViewWhenForgotPasswordPasswordIsAtInit() throws {
        welcome = WelcomeMock(currentView: .forgotPassword(type: .password))
        let _ = try XCTUnwrap(welcome)
        let sut = try XCTUnwrap(sut)
        XCTAssertEqual(sut.indexOfCurrentlySelectedView, 1)
    }
    
    /// Are Current View Data Valid And Insert User Data
    func testAreCurrentViewDataValidAndInsertUserData() throws {
        /// Registration
        var sut = try XCTUnwrap(sut)
        XCTAssertFalse(sut.areCurrentViewDataValid)
        
        sut.insertUserData(with: "name", fromTextFieldWithType: .name)
        sut.insertUserData(with: "surname", fromTextFieldWithType: .surname)
        XCTAssertTrue(sut.areCurrentViewDataValid)
        
        welcome = Welcome(currentView: .register(type: .companyData))
        sut = try XCTUnwrap(self.sut)
        XCTAssertFalse(sut.areCurrentViewDataValid)
        
        sut.insertUserData(with: "company", fromTextFieldWithType: .company)
        sut.insertUserData(with: "111222333", fromTextFieldWithType: .mobile)
        XCTAssertTrue(sut.areCurrentViewDataValid)
        
        welcome = Welcome(currentView: .register(type: .password))
        sut = try XCTUnwrap(self.sut)
        XCTAssertFalse(sut.areCurrentViewDataValid)
        
        sut.insertUserData(with: "mail@mail.com", fromTextFieldWithType: .login)
        sut.insertUserData(with: "password", fromTextFieldWithType: .password)
        XCTAssertTrue(sut.areCurrentViewDataValid)
        
        /// Login
        welcome = Welcome(currentView: .login)
        sut = try XCTUnwrap(self.sut)
        XCTAssertFalse(sut.areCurrentViewDataValid)
        
        sut.insertUserData(with: "mail@mail.com", fromTextFieldWithType: .login)
        sut.insertUserData(with: "password", fromTextFieldWithType: .password)
        XCTAssertTrue(sut.areCurrentViewDataValid)
        
        /// Forgot Password
        welcome = Welcome(currentView: .forgotPassword(type: .login))
        sut = try XCTUnwrap(self.sut)
        XCTAssertFalse(sut.areCurrentViewDataValid)
        
        sut.insertUserData(with: "mail@mail.com", fromTextFieldWithType: .login)
        XCTAssertTrue(sut.areCurrentViewDataValid)
        
        welcome = Welcome(currentView: .forgotPassword(type: .password))
        sut = try XCTUnwrap(self.sut)
        XCTAssertFalse(sut.areCurrentViewDataValid)
        
        sut.insertUserData(with: "password", fromTextFieldWithType: .password)
        XCTAssertTrue(sut.areCurrentViewDataValid)
    }
    
    /// Present Next View At The Hierrarchy
    ///
    /// Registrartion Personal Data
    func testRegistrationPersonalDataAtInitWhenPresentNextViewAtTheHierarchyShouldBeRegistrationCompanyDataView() throws {
        let sut = try XCTUnwrap(sut)
        sut.presentNextViewAtTheHierarchy()
        XCTAssertEqual(sut.currentWelcomeViewType, .register(type: .companyData))
    }
    
    func testRegistrationCompanyDataAtInitWhenPresentNextViewAtTheHierarchyShouldBePasswordDataView() throws {
        welcome = Welcome(currentView: .register(type: .companyData))
        let sut = try XCTUnwrap(sut)
        sut.presentNextViewAtTheHierarchy()
        XCTAssertEqual(sut.currentWelcomeViewType, .register(type: .password))
    }
    
    /// Present View At Welcome View Type
    
    func testPresentViewAtWelcomeViewType() throws {
        try assertViewsAfterPresentViewAction(at: .register(type: .personalData))
        try assertViewsAfterPresentViewAction(at: .register(type: .companyData))
        try assertViewsAfterPresentViewAction(at: .register(type: .password))
        try assertViewsAfterPresentViewAction(at: .login)
        try assertViewsAfterPresentViewAction(at: .forgotPassword(type: .login))
        try assertViewsAfterPresentViewAction(at: .forgotPassword(type: .password))
    }
    
    /// Build User Model DTO
    
    func testBuildUserModelDTO() throws {
        let sut = try XCTUnwrap(sut)
        
        sut.insertUserData(with: "name", fromTextFieldWithType: .name)
        sut.insertUserData(with: "surname", fromTextFieldWithType: .surname)
        sut.insertUserData(with: "company", fromTextFieldWithType: .company)
        sut.insertUserData(with: "111222333", fromTextFieldWithType: .mobile)
        sut.insertUserData(with: "mail@mail.com", fromTextFieldWithType: .login)
        sut.insertUserData(with: "password", fromTextFieldWithType: .password)
        
        let user = sut.buildUserModelDTO()
        
        XCTAssertNotNil(user)
        XCTAssertEqual(user?.name, "name")
        XCTAssertEqual(user?.surname, "surname")
        XCTAssertEqual(user?.company, "company")
        XCTAssertEqual(user?.mobile, "111222333")
        XCTAssertEqual(user?.mail, "mail@mail.com")
        XCTAssertEqual(user?.password, "password")
    }
    
    // MARK: - Private Methods
    
    private func assertViewsAfterPresentViewAction(at type: WelcomeViewType) throws {
        let sut = try XCTUnwrap(sut)
        sut.presentView(at: type)
        
        XCTAssertEqual(sut.currentWelcomeViewType, type)
    }
}

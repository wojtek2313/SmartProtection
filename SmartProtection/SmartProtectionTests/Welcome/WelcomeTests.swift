//
//  WelcomeTests.swift
//  SmartProtectionTests
//
//  Created by Wojciech Kulas on 18/07/2024.
//

import XCTest
import SmartProtection

final class WelcomeTests: XCTestCase {
    // MARK: - Private Properties
    
    private var sut: Welcome?
    
    // MARK: - Tear Down
    
    override func tearDown() {
        sut = nil
    }
    
    // MARK: - Tests
    
    /// Current View Property Tests
    func testIfCurrentViewSetAsLoginInInitMatches() throws {
        XCTAssertTrue(try currentViewAssert(at: .login))
    }
    
    func testIfCurrentViewSetAsRegisterInInitMatches() throws {
        XCTAssertTrue(try currentViewAssert(at: .register(type: .password)))
        XCTAssertTrue(try currentViewAssert(at: .register(type: .personalData)))
        XCTAssertTrue(try currentViewAssert(at: .register(type: .companyData)))
    }
    
    func testIfCurrentViewSetAsForgotPasswordInInitMatches() throws {
        XCTAssertTrue(try currentViewAssert(at: .forgotPassword(type: .password)))
        XCTAssertTrue(try currentViewAssert(at: .forgotPassword(type: .login)))
    }
    
    /// Registration View Type Matching With Index Of Selected View Tests
    func testIfViewTypeMatchesWithIndexOfSelectedView() throws {
        initSUTWithRegistrationViewType(.personalData)
        XCTAssertEqual(sut?.indexOfCurrentlySelectedView, RegistrationViewType.personalData.tag)
        
        initSUTWithRegistrationViewType(.companyData)
        XCTAssertEqual(sut?.indexOfCurrentlySelectedView, RegistrationViewType.companyData.tag)
        
        initSUTWithRegistrationViewType(.password)
        XCTAssertEqual(sut?.indexOfCurrentlySelectedView, RegistrationViewType.password.tag)
    }
    
    /// User Data Model Tests
    func testOnInsertUserDataUserModelUpdates() throws {
        initSUTWithRegistrationViewType(.personalData)
        let user = createUserModel()
        
        var sut = try XCTUnwrap(sut, "System under test is nil")
        
        let name = try XCTUnwrap(user.name, "Wrong Mock User Data")
        sut.insertUserData(with: name, fromTextFieldWithType: .name)
        
        let surname = try XCTUnwrap(user.surname, "Wrong Mock User Data")
        sut.insertUserData(with: surname, fromTextFieldWithType: .surname)
        
        let company = try XCTUnwrap(user.company, "Wrong Mock User Data")
        sut.insertUserData(with: company, fromTextFieldWithType: .company)
        
        let mobile = try XCTUnwrap(user.mobile, "Wrong Mock User Data")
        sut.insertUserData(with: mobile, fromTextFieldWithType: .mobile)
        
        let mail = try XCTUnwrap(user.mail, "Wrong Mock User Data")
        sut.insertUserData(with: mail, fromTextFieldWithType: .login)
        
        let password = try XCTUnwrap(user.password, "Wrong Mock User Data")
        sut.insertUserData(with: password, fromTextFieldWithType: .password)
        
        XCTAssertEqual(user, sut.buildUserModel)
    }
    
    /// Welcome View Navigation Tests
    func testRegistrationFlowAtPersonalDataStepTheNextStepIsCompanyData() {
        initSUTWithRegistrationViewType(.personalData)
        sut?.presentNextViewAtTheHierarchy()
        
        XCTAssertEqual(sut?.currentView, .register(type: .companyData))
    }
    
    func testRegistrationFlowAtCompanyDataStepTheNextStepIsCompanyData() {
        initSUTWithRegistrationViewType(.companyData)
        sut?.presentNextViewAtTheHierarchy()
        
        XCTAssertEqual(sut?.currentView, .register(type: .password))
    }
    
    func testNavigationByPresentViewMethod() {
        initSUTWithRegistrationViewType(.personalData)
        XCTAssertEqual(sut?.currentView, .register(type: .personalData))
        
        sut?.presentView(at: .login)
        XCTAssertEqual(sut?.currentView, .login)
        
        sut?.presentView(at: .forgotPassword(type: .password))
        XCTAssertEqual(sut?.currentView, .forgotPassword(type: .password))
        
        sut?.presentView(at: .forgotPassword(type: .login))
        XCTAssertEqual(sut?.currentView, .forgotPassword(type: .login))
        
        sut?.presentView(at: .register(type: .companyData))
        XCTAssertEqual(sut?.currentView, .register(type: .companyData))
        
        sut?.presentView(at: .register(type: .password))
        XCTAssertEqual(sut?.currentView, .register(type: .password))
        
        sut?.presentView(at: .register(type: .personalData))
        XCTAssertEqual(sut?.currentView, .register(type: .personalData))
    }
    
    // MARK: - Private Methods
    
    private func currentViewAssert(at viewType: WelcomeViewType) throws -> Bool {
        sut = .init(currentView: viewType)
        let loginCurrentView = viewType
        let sut = try XCTUnwrap(sut, "System under test is nil")
        return sut.currentView == loginCurrentView
    }
    
    private func initSUTWithRegistrationViewType(_ type: RegistrationViewType) {
        sut = .init(currentView: .register(type: type))
        XCTAssertNotNil(sut)
    }
    
    private func createUserModel() -> Welcome.User {
        return Welcome.User(
            name: "test1",
            surname: "test2",
            company: "test3",
            mobile: "123123123",
            mail: "test@test.com",
            password: "test1234"
        )
    }
}

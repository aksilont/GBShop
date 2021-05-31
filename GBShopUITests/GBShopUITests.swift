//
//  GBShopUITests.swift
//  GBShopUITests
//
//  Created by Aksilont on 13.02.2021.
//

import XCTest

class GBShopUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        setupSnapshot(app)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAuth() throws {
        
        app.launch()
        
        let tabBarProfile = app.buttons["profile"].firstMatch
        XCTAssertTrue(tabBarProfile.isHittable, "\(app.debugDescription)")
        tabBarProfile.tap()
        
        snapshot("LoginScreen")
        
        let authView = app.otherElements["authView"].firstMatch
        XCTAssertTrue(authView.waitForExistence(timeout: 2.0))
        
        let userNameField = authView.textFields["userName"]
        XCTAssertTrue(userNameField.hasFocus)
        userNameField.typeText("admin")
        
        let passwordField = authView.textFields["password"]
        passwordField.tap()
        XCTAssertTrue(passwordField.hasFocus)
        passwordField.typeText("123456")
        
        let loginButton = app.buttons["authButton"].firstMatch
        XCTAssertTrue(loginButton.isHittable, "\(app.debugDescription)")
        loginButton.tap()
        
        let profileView = app.otherElements["profileView"].firstMatch
        XCTAssertTrue(profileView.waitForExistence(timeout: 5.0))
        
        snapshot("WelcomeScreen")
    }
    
    func testSignUp() throws {
        
        app.launch()
        
        let tabBarProfile = app.buttons["profile"].firstMatch
        XCTAssertTrue(tabBarProfile.isHittable, "\(app.debugDescription)")
        tabBarProfile.tap()
        
        let authView = app.otherElements["authView"].firstMatch
        XCTAssertTrue(authView.waitForExistence(timeout: 2.0))
        
        let signUpButton = app.buttons["singUpButton"].firstMatch
        XCTAssertTrue(signUpButton.isHittable, "\(app.debugDescription)")
        signUpButton.tap()
        
        let signUpView = app.otherElements["signUpView"].firstMatch
        XCTAssertTrue(signUpView.waitForExistence(timeout: 5.0))
        
        snapshot("SignUpScreen")
        
        let userNameField = signUpView.textFields.element(boundBy: 0)
        userNameField.tap()
        XCTAssertTrue(userNameField.hasFocus)
        userNameField.typeText("admin")
        
        let passwordField = signUpView.textFields.element(boundBy: 1)
        passwordField.tap()
        XCTAssertTrue(passwordField.hasFocus)
        passwordField.typeText("1234")
        
        let emailField = signUpView.textFields.element(boundBy: 2)
        emailField.tap()
        XCTAssertTrue(emailField.hasFocus)
        emailField.typeText("test@test.ru")
        
        let genderField = signUpView.textFields.element(boundBy: 3)
        genderField.tap()
        XCTAssertTrue(genderField.hasFocus)
        genderField.typeText("male")
        
        let cardField = signUpView.textFields.element(boundBy: 4)
        cardField.tap()
        XCTAssertTrue(cardField.hasFocus)
        cardField.typeText("1234-5678-9012")
        
        let aboutField = signUpView.textFields.element(boundBy: 5)
        aboutField.tap()
        XCTAssertTrue(aboutField.hasFocus)
        aboutField.typeText("Something about me")
        
        let confirmSignUpButton = app.buttons["confirmSignUpButton"].firstMatch
        XCTAssertTrue(confirmSignUpButton.isHittable, "\(app.debugDescription)")
        confirmSignUpButton.tap()
    }
}

extension XCUIElement {
    var hasFocus: Bool {
        self.value(forKey: "hasKeyboardFocus") as? Bool ?? false
    }
}

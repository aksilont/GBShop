//
//  GBShopUITests.swift
//  GBShopUITests
//
//  Created by Aksilont on 13.02.2021.
//

import XCTest

class GBShopUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAuth() throws {
        let app = XCUIApplication()
        app.launch()
        
        let tabBarProfile = app.buttons["profile"].firstMatch
        XCTAssertTrue(tabBarProfile.isHittable, "\(app.debugDescription)")
        tabBarProfile.tap()
        
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
    }
}

extension XCUIElement {
    var hasFocus: Bool {
        self.value(forKey: "hasKeyboardFocus") as? Bool ?? false
    }
}

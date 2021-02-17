//
//  AuthTests.swift
//  GBShopTests
//
//  Created by Aksilont on 17.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class AuthTests: XCTestCase {

    // MARK: - Positive tests
    func testLogin() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let auth = Auth(errorParser: ErrorParser(),
                        sessionManager: session,
                        queue: DispatchQueue.global(qos: .utility),
                        baseUrl: baseUrl)
        
        let loggedIn = expectation(description: "loged in")
        auth.login(userName: "Somebody", password: "mypassword") { (response) in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                XCTAssertEqual(model.user.id, 123)
                XCTAssertEqual(model.user.login, "geekbrains")
                XCTAssertEqual(model.user.name, "John")
                XCTAssertEqual(model.user.lastName, "Doe")
                
                loggedIn.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 1)
    }
    
    // MARK: - Negative tests
    func testFailedLogin() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://failurl.com/"))
        
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let auth = Auth(errorParser: ErrorParser(),
                        sessionManager: session,
                        queue: DispatchQueue.global(qos: .utility),
                        baseUrl: baseUrl)
        
        let loggedIn = expectation(description: "loged in")
        auth.login(userName: "Somebody", password: "mypassword") { (response) in
            switch response.result {
            case .success(let model):
                XCTFail("Must have failed: \(model)")
            case .failure:
                loggedIn.fulfill()
            }
        }
        
        waitForExpectations(timeout: 1)
    }
}

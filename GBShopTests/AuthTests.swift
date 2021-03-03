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
        let baseUrl = try XCTUnwrap(URL(string: "https://dry-earth-72663.herokuapp.com/"))
        
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        let session = Session(configuration: configuration)
        
        let auth = Auth(errorParser: ErrorParser(),
                        sessionManager: session,
                        baseUrl: baseUrl)
        
        let authExpectation = expectation(description: "loged in")
        auth.login(userName: "Somebody", password: "mypassword") { (response) in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                XCTAssertEqual(model.user.id, 123)
                XCTAssertEqual(model.user.login, "Test")
                XCTAssertEqual(model.user.name, "Name")
                XCTAssertEqual(model.user.lastName, "Last name")
                
                authExpectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        wait(for: [authExpectation], timeout: 5.0)
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
                        baseUrl: baseUrl)
        
        let authExpectation = expectation(description: "loged in")
        auth.login(userName: "Somebody", password: "mypassword") { (response) in
            switch response.result {
            case .success(let model):
                XCTFail("Must have failed: \(model)")
            case .failure:
                authExpectation.fulfill()
            }
        }
        
        wait(for: [authExpectation], timeout: 5.0)
    }
}

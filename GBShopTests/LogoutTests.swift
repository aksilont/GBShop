//
//  LogoutTests.swift
//  GBShopTests
//
//  Created by Aksilont on 17.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class LogoutTests: XCTestCase {

    // MARK: - Positive tests
    func testLogout() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://dry-earth-72663.herokuapp.com/"))
        
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        
        let session = Session(configuration: configuration)
        
        let logout = Logout(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        let logoutExpectation = expectation(description: "Logout")
        
        logout.logout(id: "555") { (response) in
            switch response.result {
            case .success(let modelResult):
                XCTAssertEqual(modelResult.result, 1)
                logoutExpectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        wait(for: [logoutExpectation], timeout: 5.0)
    }
    
    // MARK: - Negative tests
    func testFailedLogout() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://failUrl"))
        
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        
        let session = Session(configuration: configuration)
        
        let logout = Logout(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        let logoutExpectation = expectation(description: "Logout")
        
        logout.logout(id: "555") { (response) in
            switch response.result {
            case .success(let modelResult):
                XCTFail("Should have a error \(modelResult)")
            case .failure:
                logoutExpectation.fulfill()
            }
        }
        
        wait(for: [logoutExpectation], timeout: 5.0)
    }
}

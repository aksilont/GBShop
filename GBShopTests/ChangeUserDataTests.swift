//
//  ChangeUserDataTests.swift
//  GBShopTests
//
//  Created by Aksilont on 17.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class ChangeUserDataTests: XCTestCase {

    // MARK: - Positive tests
    func testChangeUserData() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        
        let session = Session(configuration: configuration)
        
        let changeUserData = ChangeUserData(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        let changeUserDataExpectation = expectation(description: "Logout")
        
        changeUserData.changeUserData(id: "123", userName: "Alice", password: "zxcvb", email: "n@n.n", gender: "female", creditCard: "0000", bio: "...") { (response) in
            switch response.result {
            case .success(let modelResult):
                XCTAssertEqual(modelResult.result, 1)
                changeUserDataExpectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        wait(for: [changeUserDataExpectation], timeout: 5.0)
    }
    
    // MARK: - Negative tests
    func testFailedChangeUserData() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://failUrl"))
        
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        
        let session = Session(configuration: configuration)
        
        let changeUserData = ChangeUserData(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        let changeUserDataExpectation = expectation(description: "Change user data")
        
        changeUserData.changeUserData(id: "123", userName: "Alice", password: "zxcvb", email: "n@n.n", gender: "female", creditCard: "0000", bio: "...") { (response) in
            switch response.result {
            case .success(let modelResult):
                XCTFail("Should have a error \(modelResult)")
            case .failure:
                changeUserDataExpectation.fulfill()
            }
        }
        
        wait(for: [changeUserDataExpectation], timeout: 5.0)
    }
}

//
//  SignUpTests.swift
//  GBShopTests
//
//  Created by Aksilont on 17.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class SignUpTests: XCTestCase {

    // MARK: - Positive tests
    func testSignUp() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        
        let session = Session(configuration: configuration)
        
        let signUp = SignUp(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        let loggedIn = expectation(description: "Sign Up")
        
        signUp.signUp(id: "123", userName: "Bob", password: "qwer", email: "mail@mail.ru", gender: "male", creditCard: "123", bio: "About..."){ (response) in
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.result, 1)
                
                loggedIn.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 1)
    }
    
    // MARK: - Negative tests
    func testFailedSignUp() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://failUrl"))
        
        let configuration = URLSessionConfiguration.default
        configuration.httpShouldSetCookies = false
        configuration.headers = .default
        
        let session = Session(configuration: configuration)
        
        let signUp = SignUp(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        let signUpExpectation = XCTestExpectation(description: "Sign Up")
        
        signUp.signUp(id: "123", userName: "Bob", password: "qwer", email: "mail@mail.ru", gender: "male", creditCard: "123", bio: "About..."){ (response) in
            switch response.result {
            case .success(let model):
                XCTFail("Should have failed \(model)")
            case .failure:
                signUpExpectation.fulfill()
            }
        }
        
        wait(for: [signUpExpectation], timeout: 5)
    }
}

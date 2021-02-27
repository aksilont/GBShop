//
//  RequestFactoryTests.swift
//  GBShopTests
//
//  Created by Aksilont on 17.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class RequestFactoryTests: XCTestCase {
    
    func testAuthorize() throws {
        // Given
        // Initialize test data and system under test
        let baseUrl = try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        let requestFactory = RequestFactory(baseUrl: baseUrl)
        let auth = requestFactory.makeAuthRequestFactory()
        
        // When
        // Call system under test
        let signedIn = expectation(description: "Login")
        auth.login(userName: "Somebody", password: "mypassword") { (response) in
            // Then
            // Verify that output is as expected
            switch response.result {
            case .success(let model):
                XCTAssertEqual(model.user.id, 123)
                signedIn.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        waitForExpectations(timeout: 5)
    }
    
    

}

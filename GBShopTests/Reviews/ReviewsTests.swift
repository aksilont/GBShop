//
//  ReviewsTests.swift
//  GBShopTests
//
//  Created by Aksilont on 28.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class ReviewsTests: XCTestCase {

    var baseUrl: URL!
    var failUrl: URL!
    var session: Session!
    
    override func setUpWithError() throws {
        baseUrl = try XCTUnwrap(URL(string: "https://dry-earth-72663.herokuapp.com/"))
        failUrl = try XCTUnwrap(URL(string: "https://failURL"))
        
        let configureation = URLSessionConfiguration.default
        configureation.httpShouldSetCookies = false
        configureation.headers = .default
        
        session = Session(configuration: configureation)
    }

    override func tearDownWithError() throws {
        baseUrl = nil
        failUrl = nil
        session = nil
    }
    
    // MARK: - Test Init Review Manager
    
    func testInitAddReview() throws {
        let reviewManager = ReviewManager(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        XCTAssertNotNil(reviewManager, "Init Add Review")
    }
    
    // MARK: - Tests Add Review
    
    func testAddReview() throws {
        let reviewManager = ReviewManager(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        let expect = expectation(description: "Add review")
        
        reviewManager.addReview(userId: 1, text: "Text review") { response in
            switch response.result {
            case .success(let modelResult):
                XCTAssertEqual(modelResult.result, 1)
                XCTAssertEqual(modelResult.userMessage, "Ваш отзыв был передан на модерацию")
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5.0)
    }
    
    func testAddReviewFail() throws {
        let reviewManager = ReviewManager(errorParser: ErrorParser(), sessionManager: session, baseUrl: failUrl)
        let expect = expectation(description: "Add review Fail")
        
        reviewManager.addReview(userId: 1, text: "Text review") { response in
            switch response.result {
            case .success(let modelResult):
                XCTFail("Should have a error \(modelResult)")
            case .failure:
                expect.fulfill()
            }
        }
        waitForExpectations(timeout: 5.0)
    }
    
    // MARK: - Tests Approve Review
    
    func testApproveReview() throws {
        let reviewManager = ReviewManager(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        let expect = expectation(description: "Approve Review")
        
        reviewManager.approveReview(commentId: 1) { response in
            switch response.result {
            case .success(let modelResult):
                XCTAssertEqual(modelResult.result, 1)
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5.0)
    }
    
    func testApproveReviewFail() throws {
        let reviewManager = ReviewManager(errorParser: ErrorParser(), sessionManager: session, baseUrl: failUrl)
        let expect = expectation(description: "Approve Review Fail")
        
        reviewManager.approveReview(commentId: 1) { response in
            switch response.result {
            case .success(let modelResult):
                XCTFail("Should have a error \(modelResult)")
            case .failure:
                expect.fulfill()
            }
        }
        waitForExpectations(timeout: 5.0)
    }
    
    // MARK: - Tests Remove Review
    
    func testRemoveReview() throws {
        let reviewManager = ReviewManager(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        let expect = expectation(description: "Remove Review")
        
        reviewManager.removeReview(commentId: 1) { response in
            switch response.result {
            case .success(let modelResult):
                XCTAssertEqual(modelResult.result, 1)
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5.0)
    }
    
    func testRemoveReviewFail() throws {
        let reviewManager = ReviewManager(errorParser: ErrorParser(), sessionManager: session, baseUrl: failUrl)
        let expect = expectation(description: "Remove Review")
        
        reviewManager.removeReview(commentId: 1) { response in
            switch response.result {
            case .success(let modelResult):
                XCTFail("Should have a error \(modelResult)")
            case .failure:
                expect.fulfill()
            }
        }
        waitForExpectations(timeout: 5.0)
    }
    
    // MARK: - Test Get Reviews
    
    func testGetReviews() throws {
        let reviewManager = ReviewManager(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        let expect = expectation(description: "Get Reviews")
        
        reviewManager.getReviews(pageNumber: 1) { response in
            switch response.result {
            case .success(let modelResult):
                XCTAssertEqual(modelResult.reviews.count, 4)
                expect.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 5.0)
    }
    
    func testGetReviewsFail() throws {
        let reviewManager = ReviewManager(errorParser: ErrorParser(), sessionManager: session, baseUrl: failUrl)
        let expect = expectation(description: "Get Reviews")
        
        reviewManager.getReviews(pageNumber: 1) { response in
            switch response.result {
            case .success(let modelResult):
                XCTFail("Should have a error \(modelResult)")
            case .failure:
                expect.fulfill()
            }
        }
        waitForExpectations(timeout: 5.0)
    }
}

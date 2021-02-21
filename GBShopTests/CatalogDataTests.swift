//
//  CatalogDataTests.swift
//  GBShopTests
//
//  Created by Aksilont on 21.02.2021.
//

import XCTest
import Alamofire
@testable import GBShop

class CatalogDataTests: XCTestCase {

    func testInitCatalogData() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        
        let configureation = URLSessionConfiguration.default
        configureation.httpShouldSetCookies = false
        configureation.headers = .default
        
        let session = Session(configuration: configureation)
        
        let catalogData = CatalogData(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        
        XCTAssertNotNil(catalogData, "Init Catalog Data")
    }
    
    func testGetDataFromCatalog() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/"))
        
        let configureation = URLSessionConfiguration.default
        configureation.httpShouldSetCookies = false
        configureation.headers = .default
        
        let session = Session(configuration: configureation)
        
        let catalogData = CatalogData(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        let catalogDataExpectation = expectation(description: "Catalog data")
                
        catalogData.getData(pageNumber: "1", categoryId: "1") { response in
            switch response.result {
            case .success(let modelResult):
                XCTAssertEqual(modelResult.count, 2)
                catalogDataExpectation.fulfill()
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
        
        wait(for: [catalogDataExpectation], timeout: 5.0)
    }
    
    func testFailedGetDataFromCatalog() throws {
        let baseUrl = try XCTUnwrap(URL(string: "https://failURL"))
        
        let configureation = URLSessionConfiguration.default
        configureation.httpShouldSetCookies = false
        configureation.headers = .default
        
        let session = Session(configuration: configureation)
        
        let catalogData = CatalogData(errorParser: ErrorParser(), sessionManager: session, baseUrl: baseUrl)
        let catalogDataExpectation = expectation(description: "Catalog data")
                
        catalogData.getData(pageNumber: "1", categoryId: "1") { response in
            switch response.result {
            case .success(let modelResult):
                XCTFail("Should have a error \(modelResult)")
            case .failure:
                catalogDataExpectation.fulfill()
            }
        }
        
        wait(for: [catalogDataExpectation], timeout: 5.0)
    }
}

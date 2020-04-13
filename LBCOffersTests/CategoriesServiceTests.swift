//
//  LBCOffersTests.swift
//  LBCOffersTests
//
//  Created by Mohamed Derkaoui on 12/04/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import XCTest
@testable import LBCOffers

class CategoriesServiceTests: XCTestCase {
    
    var mockArticlesService: NetworkServiceProtocol?
    var categories: [LBCOffers.Category]?
    var error: NSError?
    
    override func setUpWithError() throws {
        super.setUp()
        mockArticlesService = CategoriesService()
        categories = [LBCOffers.Category]()
    }

    override func tearDownWithError() throws {
        mockArticlesService = nil
        categories = nil
        super.tearDown()
    }
    
    func testInvalidBaseUrl() throws {
        let exp = expectation(description: "Loading categories")
        mockArticlesService?.baseUrlString = "sddsfrgb..3rf"
        mockArticlesService?.fetchData { categories,  err in
            self.error = err
            exp.fulfill()
        }
        waitForExpectations(timeout: 3)
        XCTAssertEqual(self.error?.domain, "InvalidURLSession")
    }

    func testArticlesServiceReturnes300Offer() throws {
        let exp = expectation(description: "Loading articles")
        mockArticlesService?.fetchData { categories,  err in
            self.categories = categories as? [LBCOffers.Category]
            exp.fulfill()
        }
        waitForExpectations(timeout: 3)
        XCTAssertEqual(categories!.count, 11, "We should have loaded exactly 11 categories.")
    }
    
    func testRandomCategoryHasName() throws {
        let exp = expectation(description: "Loading articles")
        mockArticlesService?.fetchData { categories,  err in
            self.categories = categories as? [LBCOffers.Category]
            exp.fulfill()
        }
        waitForExpectations(timeout: 3)
        XCTAssertNotNil(self.categories?.randomElement()?.name, "A random element does not have a name")
    }
    
    func testLastCategoryIsDada() throws {
        let exp = expectation(description: "Loading articles")
         mockArticlesService?.fetchData { categories,  err in
           self.categories = categories as? [LBCOffers.Category]
           exp.fulfill()
       }
        waitForExpectations(timeout: 3)
        XCTAssertEqual(self.categories?.last?.name, "Enfants","The last category is not Enfants")
    }

}

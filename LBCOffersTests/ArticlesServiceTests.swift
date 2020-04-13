//
//  LBCOffersTests.swift
//  LBCOffersTests
//
//  Created by Mohamed Derkaoui on 12/04/2020.
//  Copyright © 2020 Mohamed Derkaoui. All rights reserved.
//

import XCTest
@testable import LBCOffers

class ArticlesServiceTests: XCTestCase {
    
    var mockArticlesService: NetworkServiceProtocol?
    var articles: [Article]?
    var error: NSError?
    
    override func setUpWithError() throws {
        super.setUp()
        mockArticlesService = ArticlesService()
        articles = [Article]()
    }

    override func tearDownWithError() throws {
        mockArticlesService = nil
        articles = nil
        super.tearDown()
    }
    
    func testInvalidBaseUrl() throws {
        let exp = expectation(description: "Loading articles")
        mockArticlesService?.baseUrlString = "sdvsvu.cwecw.we23rf"
        mockArticlesService?.fetchData { articles,  err in
            self.error = err
            exp.fulfill()
        }
        waitForExpectations(timeout: 3)
        XCTAssertEqual(self.error?.domain, "InvalidURLSession")
    }

    func testArticlesServiceReturnes300Offer() throws {
        let exp = expectation(description: "Loading articles")
        mockArticlesService?.fetchData { articles,  err in
            self.articles = articles as? [Article]
            exp.fulfill()
        }
        waitForExpectations(timeout: 3)
        XCTAssertEqual(articles!.count, 300, "We should have loaded exactly 300 offres.")
    }
    
    func testRandomOfferHasTitle() throws {
        let exp = expectation(description: "Loading articles")
        mockArticlesService?.fetchData { articles,  err in
            self.articles = articles as? [Article]
            exp.fulfill()
        }
        waitForExpectations(timeout: 3)
        XCTAssertNotNil(self.articles?.randomElement()?.title, "A random element does not have a title")
    }
    
    func testRandomOfferHasPrice() throws {
        let exp = expectation(description: "Loading articles")
        mockArticlesService?.fetchData { articles,  err in
            self.articles = articles as? [Article]
            exp.fulfill()
        }
        waitForExpectations(timeout: 3)
        XCTAssertNotNil(self.articles?.randomElement()?.price, "A random element does not have a price")
    }

}

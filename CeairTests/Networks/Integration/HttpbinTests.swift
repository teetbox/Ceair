//
//  HttpbinTests.swift
//  CeairTests
//
//  Created by Tong Tian on 9/22/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class HttpbinTests: XCTestCase {
    
    var aintx: Aintx!
    
    override func setUp() {
        super.setUp()
        aintx = Aintx(url: "http://httpbin.org")
    }
    
    func testGet() {
        let asyncExpectation = expectation(description: "async")
        
        aintx.go("/get") { (httpResponse) in
            XCTAssertNil(httpResponse.error)
            XCTAssertNotNil(httpResponse.data)

            asyncExpectation.fulfill()
        }
        
        wait(for: [asyncExpectation], timeout: 5)
    }
    
    func testPost() {
        let asyncExpectation = expectation(description: "async")
        
        aintx.go("/post", method: .post) { (httpResponse) in
            XCTAssertNil(httpResponse.error)
            XCTAssertNotNil(httpResponse.data)
            
            asyncExpectation.fulfill()
        }
        
        wait(for: [asyncExpectation], timeout: 5)
    }
    
}

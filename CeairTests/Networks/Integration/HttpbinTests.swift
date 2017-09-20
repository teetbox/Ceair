//
//  HttpbinTests.swift
//  CeairTests
//
//  Created by Tong Tian on 9/18/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class HttpbinTests: XCTestCase {
    
    var aintx: Aintx!
    
    override func setUp() {
        super.setUp()
        
        aintx = Aintx(baseURL: "http://httpbin.org")
    }
    
    func testSimpleGet() {
        let asyncRequest = expectation(description: "async")
        
        let request = aintx.setupHttpRequest(path: "/get")
        request.fire { httpResponse in
            print(httpResponse.toJSON())
            
            XCTAssertNil(httpResponse.error)
            XCTAssertNotNil(httpResponse.response)
            XCTAssertNotNil(httpResponse.data)
            asyncRequest.fulfill()
        }
        
        wait(for: [asyncRequest], timeout: 5)
    }
    
}

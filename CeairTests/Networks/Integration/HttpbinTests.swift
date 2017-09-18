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
    
    var requestInfo: ResponseInfo!
    
    override func setUp() {
        super.setUp()

        requestInfo = NetworkHandler.GetRequestInfo
        requestInfo[NETWORKS.Host] = "http://httpbin.org"
    }
    
    func testExample() {
        requestInfo[NETWORKS.EndPoint] = "/get"
        
        let asyncGet = expectation(description: "get")
        
        Aintx.dataRequest(urlString: "http://httpbin.org/get", method: .get, requestInfo: requestInfo) { response in
            if let data = response.data {
                print(data)
            }
            asyncGet.fulfill()
            XCTAssertNil(response.error)
        }
        
        wait(for: [asyncGet], timeout: 5)
    }
    
}

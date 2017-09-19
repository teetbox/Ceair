//
//  AintxTests.swift
//  CeairTests
//
//  Created by Tong Tian on 16/09/2017.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class AintxTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testDataRequestDefaultMethod() {
        let requestInfo = [NETWORKS.SessionKey: SessionType.standard]
        Aintx.dataRequest(path: "fakeURL", requestInfo: requestInfo) { (response) in
            
        }
    }
    
    func testDataRequestDefaultSession() {
        let requestInfo = [NETWORKS.SessionKey: "fakeSession"]
        let asyncExpectation = expectation(description: "async")
        
        Aintx.dataRequest(path: "fakeURL", method: .get, requestInfo: requestInfo) { (response) in
            XCTAssertNil(response.networkError)
            XCTAssertNil(response.error)
            
            asyncExpectation.fulfill()
        }
        
        wait(for: [asyncExpectation], timeout: 500)
    }
    
    func testDataRequestMissingRequestInfo() {
        let requestInfo = [NETWORKS.SessionKey: "fakeSession"]
        Aintx.dataRequest(path: "fakeURL", method: .get, requestInfo: requestInfo) { (response) in
            let error = response.error as? NetworkError
            XCTAssertNotEqual(error?.localizedDescription, "Request Failed: Missing requestInfo 'sessionType'")
        }
    }
    
}

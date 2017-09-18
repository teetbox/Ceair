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
    
    func testDataRequestMissingSessionKey() {
        let requestInfo = [NETWORKS.SessionKey: "fakeSession"]
        Aintx.dataRequest(urlString: "fakeURL", method: .get, requestInfo: requestInfo) { (response) in
            let error = response.error as? NetworkError
            XCTAssertEqual(error?.localizedDescription, "Request Failed: Missing requestInfo 'sessionType'")
        }
    }
    
}

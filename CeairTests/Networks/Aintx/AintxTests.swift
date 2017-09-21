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
    
    var aintx: Aintx!
    
    override func setUp() {
        super.setUp()
        
        aintx = Aintx(url: "www.fake.com")
    }
    
    func testGoWithPath() {
        aintx.isFake = true
        
        aintx.go("/get") { response in
            print("Aintx Go")
            
            XCTAssertEqual(aintx.httpMethod, .get)
            XCTAssertEqual(aintx.requestType, .data)
        }
    }
    
}

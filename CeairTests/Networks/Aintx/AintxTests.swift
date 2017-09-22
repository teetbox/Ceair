//
//  AintxTests.swift
//  CeairTests
//
//  Created by Tong Tian on 16/09/2017.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

extension SessionConfig: Equatable {
    public static func ==(lhs: SessionConfig, rhs: SessionConfig) -> Bool {
        return "\(lhs)" == "\(rhs)"
    }
}

class AintxTests: XCTestCase {
    
    var aintx: Aintx!
    
    override func setUp() {
        super.setUp()
        
        aintx = Aintx(url: "www.fake.com")
    }
    
    func testInitWithDefaultSession() {
        XCTAssertEqual(aintx.sessionConfig, .default)
    }
    
    func testInitWithEphemeralSession() {
        aintx = Aintx(url: "www.fake.com", config: .ephemeral)
        XCTAssertEqual(aintx.sessionConfig, .ephemeral)
    }
    
    func testInitWithBackgroundSession() {
        aintx = Aintx(url: "www.fake.com", config: .background("background"))
        XCTAssertEqual(aintx.sessionConfig, .background("background"))
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

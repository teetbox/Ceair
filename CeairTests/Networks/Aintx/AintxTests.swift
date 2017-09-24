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
        aintx = Aintx(base: "http://www.fake.com")
    }
    
    func testInit() {
        XCTAssertEqual(aintx.base, "http://www.fake.com")
        XCTAssertEqual(aintx.config, .default)
        XCTAssertEqual(aintx.httpMethod, .get)
        XCTAssertEqual(aintx.requestType, .data)
    }
    
    func testInitWithEphemeralSession() {
        aintx = Aintx(base: "http://www.fake.com", config: .ephemeral)
        XCTAssertEqual(aintx.config, .ephemeral)
    }
    
    func testInitWithBackgroundSession() {
        aintx = Aintx(base: "http://www.fake.com", config: .background("background"))
        XCTAssertEqual(aintx.config, .background("background"))
    }
    
    func testGoWithGet() {
        let exp = expectation(description: "exp")
        
        aintx.go("/fake/path") { response in
            XCTAssertEqual(self.aintx.httpMethod, .get)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
    }
    
    func testGoForPost() {
        let exp = expectation(description: "exp")
        let exp2 = expectation(description: "exp2")
        
        aintx.httpMethod = .post
        aintx.go("/fake/path") { response in
            XCTAssertEqual(self.aintx.httpMethod, .post)
            exp.fulfill()
        }
        
        aintx.httpMethod = .get
        aintx.go("/fake/path", method: .post) { (response) in
            XCTAssertEqual(self.aintx.httpMethod, .post)
            exp2.fulfill()
        }
        
        wait(for: [exp, exp2], timeout: 1)
    }
    
    func testGoWithDelete() {
        let exp = expectation(description: "exp")
        
        aintx.httpMethod = .delete
        aintx.go("/fake/path") { response in
            XCTAssertEqual(self.aintx.httpMethod, .delete)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
    }
    
}

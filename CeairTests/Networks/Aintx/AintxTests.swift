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
        aintx.isFake = true
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
    
    func testGo() {
        let exp = expectation(description: "exp")

        aintx.go("/fake/path") { response in
            XCTAssertEqual(response.path, "/fake/path")
            XCTAssertEqual(response.httpMethod, .get)
            XCTAssertEqual(response.requestType, .data)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
    }
    
    func testGoWithHttpMethodPost() {
        let exp = expectation(description: "exp")
        let exp2 = expectation(description: "exp2")
        
        aintx.httpMethod = .post
        aintx.go("/fake/path") { response in
            XCTAssertEqual(response.httpMethod, .post)
            exp.fulfill()
        }
        
        aintx.httpMethod = .get
        aintx.go("/fake/path", method: .post) { (response) in
            XCTAssertEqual(response.httpMethod, .post)
            exp2.fulfill()
        }
        
        wait(for: [exp, exp2], timeout: 1)
    }
    
    func testGoWithHttpMethodDelete() {
        let exp = expectation(description: "exp")
        let exp2 = expectation(description: "exp2")
        
        aintx.httpMethod = .delete
        aintx.go("/fake/path") { response in
            XCTAssertEqual(response.httpMethod, .delete)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        
        aintx.httpMethod = .get
        aintx.go("/fake/path", method: .delete) { (response) in
            XCTAssertEqual(response.httpMethod, .delete)
            exp2.fulfill()
        }
        
        wait(for: [exp, exp2], timeout: 1)
    }
    
    func testGoWithRequestTypeDownload() {
        let exp = expectation(description: "exp")
        let exp2 = expectation(description: "exp2")
        
        aintx.requestType = .downLoad
        aintx.go("/fake/path") { response in
            XCTAssertEqual(response.requestType, .downLoad)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        
        aintx.requestType = .data
        aintx.go("/fake/path", type: .downLoad) { (response) in
            XCTAssertEqual(response.requestType, .downLoad)
            exp2.fulfill()
        }
        
        wait(for: [exp, exp2], timeout: 1)
    }
    
    func testGoWithRequestTypeUpload() {
        let exp = expectation(description: "exp")
        let exp2 = expectation(description: "exp2")
        
        aintx.requestType = .upload
        aintx.go("/fake/path") { response in
            XCTAssertEqual(response.requestType, .upload)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        
        aintx.requestType = .data
        aintx.go("/fake/path", type: .downLoad) { (response) in
            XCTAssertEqual(response.requestType, .downLoad)
            exp2.fulfill()
        }
        
        wait(for: [exp, exp2], timeout: 1)
    }
    
    func testGoWithRequestTypeStream() {
        let exp = expectation(description: "exp")
        let exp2 = expectation(description: "exp2")
        
        aintx.requestType = .stream
        aintx.go("/fake/path") { response in
            XCTAssertEqual(response.requestType, .stream)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        
        aintx.requestType = .data
        aintx.go("/fake/path", type: .stream) { (response) in
            XCTAssertEqual(response.requestType, .stream)
            exp2.fulfill()
        }
        
        wait(for: [exp, exp2], timeout: 1)
    }
    
}

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
    
    let fakeBase = "http://www.fake.com"
    let fakePath = "/fake/path"
    
    override func setUp() {
        super.setUp()
        aintx = Aintx(base: fakeBase)
        aintx.isFake = true
    }
    
    func testInit() {
        XCTAssertEqual(aintx.base, fakeBase)
        XCTAssertEqual(aintx.config, .default)
        XCTAssertEqual(aintx.httpMethod, .get)
        XCTAssertEqual(aintx.requestType, .data)
    }
    
    func testInitWithEphemeralSession() {
        aintx = Aintx(base: fakeBase, config: .ephemeral)
        XCTAssertEqual(aintx.config, .ephemeral)
    }
    
    func testInitWithBackgroundSession() {
        aintx = Aintx(base: fakeBase, config: .background("background"))
        XCTAssertEqual(aintx.config, .background("background"))
    }
    
    func testGoPath() {
        let exp = expectation(description: "exp")

        aintx.go(fakePath) { response in
            XCTAssertEqual(response.path, "/fake/path")
            XCTAssertEqual(response.httpMethod, .get)
            XCTAssertEqual(response.requestType, .data)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
    }
    
    func testGoPathWithHttpMethodPost() {
        let exp = expectation(description: "exp")
        let exp2 = expectation(description: "exp2")
        
        aintx.httpMethod = .post
        aintx.go(fakePath) { response in
            XCTAssertEqual(response.httpMethod, .post)
            exp.fulfill()
        }
        
        aintx.httpMethod = .get
        aintx.go(fakePath, method: .post) { (response) in
            XCTAssertEqual(response.httpMethod, .post)
            exp2.fulfill()
        }
        
        wait(for: [exp, exp2], timeout: 1)
    }
    
    func testGoPathWithHttpMethodDelete() {
        let exp = expectation(description: "exp")
        let exp2 = expectation(description: "exp2")
        
        aintx.httpMethod = .delete
        aintx.go(fakePath) { response in
            XCTAssertEqual(response.httpMethod, .delete)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        
        aintx.httpMethod = .get
        aintx.go(fakePath, method: .delete) { (response) in
            XCTAssertEqual(response.httpMethod, .delete)
            exp2.fulfill()
        }
        
        wait(for: [exp, exp2], timeout: 1)
    }
    
    func testGoPathWithRequestTypeDownload() {
        let exp = expectation(description: "exp")
        let exp2 = expectation(description: "exp2")
        
        aintx.requestType = .downLoad
        aintx.go(fakePath) { response in
            XCTAssertEqual(response.requestType, .downLoad)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        
        aintx.requestType = .data
        aintx.go(fakePath, type: .downLoad) { (response) in
            XCTAssertEqual(response.requestType, .downLoad)
            exp2.fulfill()
        }
        
        wait(for: [exp, exp2], timeout: 1)
    }
    
    func testGoPathWithRequestTypeUpload() {
        let exp = expectation(description: "exp")
        let exp2 = expectation(description: "exp2")
        
        aintx.requestType = .upload
        aintx.go(fakePath) { response in
            XCTAssertEqual(response.requestType, .upload)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        
        aintx.requestType = .data
        aintx.go(fakePath, type: .downLoad) { (response) in
            XCTAssertEqual(response.requestType, .downLoad)
            exp2.fulfill()
        }
        
        wait(for: [exp, exp2], timeout: 1)
    }
    
    func testGoPathWithRequestTypeStream() {
        let exp = expectation(description: "exp")
        let exp2 = expectation(description: "exp2")
        
        aintx.requestType = .stream
        aintx.go(fakePath) { response in
            XCTAssertEqual(response.requestType, .stream)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 1)
        
        aintx.requestType = .data
        aintx.go(fakePath, type: .stream) { (response) in
            XCTAssertEqual(response.requestType, .stream)
            exp2.fulfill()
        }
        
        wait(for: [exp, exp2], timeout: 1)
    }
    
    func testGoRequest() {
        
    }
    
    func testCreateHttpRequest() {
        let fakeRequest = aintx.createHttpRequest(path: fakePath) as! FakeHttpRequest
        
        XCTAssertEqual(fakeRequest.base, aintx.base)
        XCTAssertEqual(fakeRequest.path, fakePath)
        XCTAssertEqual(fakeRequest.httpMethod, aintx.httpMethod)
        XCTAssertEqual(fakeRequest.requestType, aintx.requestType)
        XCTAssertEqual(fakeRequest.session, aintx.session)
    }
    
    func testCreateHttpRequestWithHttpMethod() {
        
    }
    
    func testCreateHttpRequestWithRequestType() {
        
    }
    
    func testCreateHttpRequestWithHttpMethodAndRequestType() {
        
    }
    
}

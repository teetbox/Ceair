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
        XCTAssertEqual(aintx.config, .default)
    }
    
    func testInitWithEphemeralSession() {
        aintx = Aintx(url: "www.fake.com", config: .ephemeral)
        XCTAssertEqual(aintx.config, .ephemeral)
    }
    
    func testInitWithBackgroundSession() {
        aintx = Aintx(url: "www.fake.com", config: .background("background"))
        XCTAssertEqual(aintx.config, .background("background"))
    }
    
    func testGoWithDefaultHttpMethodAndRequestType() {
        aintx.go("/fake/path") { response in
            XCTAssertEqual(self.aintx.httpMethod, .get)
            XCTAssertEqual(self.aintx.requestType, .data)
        }
    }
    
    func testGoWithCustomeHttpMethodAndRequestType() {
        aintx.httpMethod = .post
        aintx.requestType = .upload
        
        aintx.go("/fake/path") { response in
            XCTAssertEqual(self.aintx.httpMethod, .post)
            XCTAssertEqual(self.aintx.requestType, .upload)
        }
        
        aintx.httpMethod = .delete
        aintx.requestType = .data
        
        aintx.go("/fake/path") { response in
            XCTAssertEqual(self.aintx.httpMethod, .delete)
            XCTAssertEqual(self.aintx.requestType, .data)
        }
    }
    
    func testGoWithHttpMethod() {
        aintx.go("/fake/post", method: .post) { httpResponse in
        }
        
        let dataRequest = aintx.createHttpRequest(path: "/get")
        
        aintx.go(dataRequest) { (httpResponse) in
            
        }
    }
    
}

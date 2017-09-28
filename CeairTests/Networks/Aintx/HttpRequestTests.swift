//
//  HttpRequestTests.swift
//  CeairTests
//
//  Created by Tong Tian on 9/22/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class HttpRequestTests: XCTestCase {
    
    let base = "http://www.fake.com"
    let path = "/fake/path"

    func testInitHttpDataRequest() {
        let httpDataRequest = HttpDataRequest(base: base, path: path, queryString: nil, parameters: nil, session: URLSession.shared)
        
        XCTAssertEqual(httpDataRequest.base, base)
        XCTAssertEqual(httpDataRequest.path, path)
        XCTAssertEqual(httpDataRequest.session, URLSession.shared)
        XCTAssertNil(httpDataRequest.queryString)
        XCTAssertNil(httpDataRequest.parameters)
        XCTAssertNotNil(httpDataRequest.urlRequest)
        XCTAssertNil(httpDataRequest.error)
    }
    
    func testInitHttpDataRequestFailed() {
        let invalidBase = "http:\\www.fake.com"
        let httpDataRequest = HttpDataRequest(base: invalidBase, path: path, queryString: nil, parameters: nil, session: URLSession.shared)
        
        XCTAssertNil(httpDataRequest.urlRequest)
        XCTAssertNotNil(httpDataRequest.error)
        XCTAssertEqual(String(describing: httpDataRequest.error!), String(describing: HttpError.invalidURL("\(invalidBase)\(path)")))
    }
    
}

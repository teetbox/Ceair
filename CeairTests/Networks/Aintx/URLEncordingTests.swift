//
//  URLEncordingTests.swift
//  CeairTests
//
//  Created by Tong Tian on 9/28/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class URLEncordingTests: XCTestCase {
    
    let fakeBase = "http://www.fake.com"
    let fakePath = "/fake/path"
    
    func testEncordQueryString() {
        let queryString = ["key": "value", "key2": "value2"];
        let encordedURL = try? URLEncording.encordQueryString(path: fakePath, queryString: queryString)
        
        XCTAssertTrue(encordedURL!.contains("\(fakePath)?"))
        XCTAssertTrue(encordedURL!.contains("key=value&"))
        XCTAssertTrue(encordedURL!.contains("key2=value2"))
    }
    
}

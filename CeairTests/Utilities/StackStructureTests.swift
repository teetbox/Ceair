//
//  StackStructureTests.swift
//  CeairTests
//
//  Created by Matt Tian on 10/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class StackStructureTests: XCTestCase {

    func testIntStack() {
        var stack = Stack<Int>()
        
        stack.push(1)
        XCTAssertEqual(stack.peek(), 1)
        XCTAssertEqual(stack.pop(), 1)
        XCTAssertNil(stack.pop())
    }
    
    func testStringStack() {
        var stack = Stack<String>()
        
        stack.push("Hello")
        stack.push("Swift")
        XCTAssertEqual(stack.peek(), "Swift")
        XCTAssertEqual(stack.pop(), "Swift")
        XCTAssertEqual(stack.peek(), "Hello")
        XCTAssertEqual(stack.pop(), "Hello")
        XCTAssertNil(stack.peek())
        XCTAssertNil(stack.pop())
    }
    
}

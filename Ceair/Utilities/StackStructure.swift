//
//  StackStructure.swift
//  Ceair
//
//  Created by Matt Tian on 10/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

struct Stack<T> {
    
    private var array = [T]()
    
    public mutating func push(_ item: T) {
        array.append(item)
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        guard !array.isEmpty else {
            return nil
        }
        return array.removeLast()
    }
    
    public func peek() -> T? {
        return array.last
    }
    
}

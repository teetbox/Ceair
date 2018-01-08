//
//  DestinationFilterDataModel.swift
//  Ceair
//
//  Created by Matt Tian on 08/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

protocol DestinationFilterDataModelProtocol {
    func getFilters(completion: @escaping ([[String]]) -> Void)
}

struct DestinationFilterDataModel: DestinationFilterDataModelProtocol {
    
    // Dummy Data
    private let dummyFilters = [["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"], ["O", "P", "Q"]]

    func getFilters(completion: @escaping ([[String]]) -> Void) {
        completion(dummyFilters)
    }
    
}

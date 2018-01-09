//
//  DestinationFilterDataModel.swift
//  Ceair
//
//  Created by Matt Tian on 08/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation
import CEHTTP

protocol DestinationFilterDataModelProtocol {
    func getFilters(completion: @escaping ([[String]]) -> Void)
}

class DestinationFilterDataModel: DestinationFilterDataModelProtocol {
    
    var http = CEHttp(base: "")
    
    // Dummy Data
    private let dummyFilters = [["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K"], ["O", "P", "Q"]]

    func getFilters(completion: @escaping ([[String]]) -> Void) {
        
        let fakeData = NSKeyedArchiver.archivedData(withRootObject: dummyFilters)
        let httpResponse = HttpResponse(data: fakeData)

        http.fakeResponse = httpResponse
        http.get("/destinationFilter") { response in
            let data = response.data!
            if let filters = NSKeyedUnarchiver.unarchiveObject(with: data) as? [[String]] {
                completion(filters)
            }
        }
    }
    
}

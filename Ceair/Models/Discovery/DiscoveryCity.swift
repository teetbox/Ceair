//
//  DiscoveryCity.swift
//  Ceair
//
//  Created by Matt Tian on 26/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation
import SwiftyJSON

struct DiscoveryCity {
    let cityName: String
    let tagList: [String]
    let oriEngCode: String
    let desEngCode: String
    let price: Int
    let imageUrl: String
    let themeCode: String
}

extension DiscoveryCity {
    
    init(json: JSON, themeCode: String) {
        cityName = json["cityName"].stringValue
        oriEngCode = json["oriEngCode"].stringValue
        desEngCode = json["desEngCode"].stringValue
        price = json["price"].intValue
        if let tags = json["tagList"].arrayObject as? [String] {
            tagList = tags
        } else {
            tagList = []
        }
        let imageUrls = json["imageFileVOList"].arrayValue
        if imageUrls.count > 0 {
            imageUrl = imageUrls[0]["imgUrl"].stringValue
        } else {
            imageUrl = ""
        }
        self.themeCode = themeCode
    }
    
}

//
//  DiscoveryTheme.swift
//  Ceair
//
//  Created by Matt Tian on 25/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation
import SwiftyJSON

struct DiscoveryTheme {
    let themeName: String
    let themeCode: String
    let delFlag: Bool
}

extension DiscoveryTheme {
    init(json: JSON) {
        themeName = json["themeName"].stringValue
        themeCode = json["themeCode"].stringValue
        delFlag = json["delFlag"].boolValue
    }
}

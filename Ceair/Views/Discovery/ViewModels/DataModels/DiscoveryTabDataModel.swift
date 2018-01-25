//
//  DiscoveryTabDataModel.swift
//  Ceair
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation
import CEHTTP

protocol DiscoveryTabDataModelProtocol {
    func fetchThemes(completion: @escaping ([DiscoveryTheme]) -> Void)
}

struct DiscoveryTabDataModel: DiscoveryTabDataModelProtocol {
    
    let http = CEHttp(base: "https://efbplus.ceair.com:600")
    
    let themePath = "/portal/mobile/getThemeCodeList"
    
    func fetchThemes(completion: @escaping ([DiscoveryTheme]) -> Void) {
        http.get(themePath) { response in
            if let json = response.json {
                print(json)
            }
        }
    }
}

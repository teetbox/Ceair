//
//  DiscoveryDataModel.swift
//  Ceair
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation
import CEHTTP
import SwiftyJSON
import SwiftyBeaver
typealias Log = SwiftyBeaver

protocol DiscoveryDataModelProtocol {
    func fetchThemes(completion: @escaping ([DiscoveryTheme]) -> Void)
    func fetchCities(completion: @escaping ([[DiscoveryCity]]) -> Void)
    func loadImage(from url: String, completion: @escaping (String, Data) -> Void)
}

struct DiscoveryDataModel: DiscoveryDataModelProtocol {
    
    let http = CEHttp(base: "http://172.31.65.187:8080")
    let themePath = "/portal/mobile/getThemeCodeList"
    let cache = Cache<Data>()
    
    func fetchThemes(completion: @escaping ([DiscoveryTheme]) -> Void) {
        http.get(themePath) { response in
            guard let data = response.data else {
                Log.error("Fetch themes return no data!")
                return
            }
            
            var themes: [DiscoveryTheme] = []
            if let json = try? JSON(data: data) {
                themes = json["themeCodeB2cVOList"].arrayValue.map { DiscoveryTheme(json: $0) }
            } else {
                Log.error("Fetch themes return invalid json data!")
            }
            completion(themes)
        }
    }
    
    func fetchCities(completion: @escaping ([[DiscoveryCity]]) -> Void) {
        let params: Dictionary<String, Any> = ["themeCodeList": ["GUJI","HAIDAO","GOUWU","MEISHI"],
                      "months": [3],
                      "endDateStr": "2018-03-20",
                      "startDateStr": "2018-01-20",
                      "topNumber": 8,
                      "depCode": "PEK",
                      "classCode": "F,J,Y",
                      "arrCode": "",
                      "airLineCode": "MU/FM"]
        http.post("/portal/mobile/getCityThemeInfoList", params: params) { response in
            guard let data = response.data else {
                Log.error("Fetch themes return no data!")
                return
            }
            
            var themeCities = [[DiscoveryCity]]()
            if let json = try? JSON(data: data) {
                let city2DArr = json["themeActivitiesInfoVOList"].arrayValue
                for cityArr in city2DArr {
                    let themeJson = cityArr.arrayValue[0]
                    let themeCode = themeJson["themeCode"].stringValue
                    let cities = themeJson["cityThemeInfoVOList"].arrayValue.map { DiscoveryCity(json: $0, themeCode: themeCode) }
                    themeCities.append(cities)
                }
            } else {
                Log.error("Fetch cities return invalid json data!")
            }
            
            completion(themeCities)
        }
    }
    
    func loadImage(from urlString: String, completion: @escaping (String, Data) -> Void) {
        if let imageData = cache.object(forKey: urlString) {
            completion(urlString, imageData)
        } else {
            CEHttp(base: urlString, config: .ephemeral).get("") { response in
                guard let url = response.urlResponse?.url else {
                    return
                }
                guard let data = response.data else {
                    return
                }
                self.cache.cache(data, forKey: url.absoluteString)
                completion(url.absoluteString, data)
            }
        }
        
    }
    
}

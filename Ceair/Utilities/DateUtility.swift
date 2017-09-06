//
//  DateUtility.swift
//  Ceair
//
//  Created by Tong Tian on 9/6/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

enum DateStringFormat: String {
    case YMD = "yyyy-MM-dd"
    case YMDHM = "yyyy-MM-dd HH:mm"
}

struct DateUtility {
    
    static func getDate(from string: String?, format: DateStringFormat) -> Date? {
        guard let dateString = string else { return nil }
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = format.rawValue
        
        return dateFormatter.date(from: dateString)
    }
    
    static func getWeekDay(from date: Date?) -> String? {
        guard let date = date else { return nil }
        
        /* Using DateComponments
        let calender = Calendar.current
        let dateComponents = calender.dateComponents([.weekday], from: date)
        */
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        
        return dateFormatter.string(from: date)
    }
    
    static func getDurationHours(start: String?, end: String?, format: DateStringFormat) -> String? {
        guard let startString = start, let endString = end else { return nil }
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.dateFormat = format.rawValue
        
        if let startDate = dateFormatter.date(from: startString), let endDate = dateFormatter.date(from: endString) {
            let dateComponents = Calendar.current.dateComponents([.hour, .minute], from: startDate, to: endDate)
            
            if let hour = dateComponents.hour, let minute = dateComponents.minute {
                return "\(hour)H \(minute)M"
            }
        }
        
        return nil
    }
    
}

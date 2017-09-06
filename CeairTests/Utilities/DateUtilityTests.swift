//
//  DateUtilityTests.swift
//  CeairTests
//
//  Created by Tong Tian on 9/6/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class DateUtilityTests: XCTestCase {
    
    func testGetDate() {
        let dateString = "2017-09-06"
        let date = DateUtility.getDate(from: dateString, format: .YMD)
        let expectedDate = Date(timeIntervalSinceReferenceDate: 526348800)  // 2017-09-06
        
        XCTAssertEqual(date, expectedDate)
        
        let dateAndTimeString = "2017-09-06 07:11"
        let dateAndTime = DateUtility.getDate(from: dateAndTimeString, format: .YMDHM)
        let expectedDateAndTime = Date(timeIntervalSinceReferenceDate: 526374660)
        
        XCTAssertEqual(dateAndTime, expectedDateAndTime)
    }
    
    func testGetWeekday() {
        let perDay: TimeInterval = 24 * 60 * 60
        var date: Date?
        var weekday: String?
        
        date = Date(timeIntervalSinceReferenceDate: 0)  // 2001-01-01 Monday
        weekday = DateUtility.getWeekday(from: date)
        XCTAssertEqual(weekday, "Monday")
        
        date = Date(timeIntervalSinceReferenceDate: perDay)  // 2001-01-02 Tuesday
        weekday = DateUtility.getWeekday(from: date)
        XCTAssertEqual(weekday, "Tuesday")
        
        date = Date(timeIntervalSinceReferenceDate: perDay * 2)  // 2001-01-03 Wendesday
        weekday = DateUtility.getWeekday(from: date)
        XCTAssertEqual(weekday, "Wednesday")
        
        date = Date(timeIntervalSinceReferenceDate: perDay * 3)  // 2001-01-04 Thesday
        weekday = DateUtility.getWeekday(from: date)
        XCTAssertEqual(weekday, "Thursday")
        
        date = Date(timeIntervalSinceReferenceDate: perDay * 4)  // 2001-01-02 Friday
        weekday = DateUtility.getWeekday(from: date)
        XCTAssertEqual(weekday, "Friday")
        
        date = Date(timeIntervalSinceReferenceDate: perDay * 5)  // 2001-01-04 Saturday
        weekday = DateUtility.getWeekday(from: date)
        XCTAssertEqual(weekday, "Saturday")
        
        date = Date(timeIntervalSinceReferenceDate: perDay * 6)  // 2001-01-02 Sunday
        weekday = DateUtility.getWeekday(from: date)
        XCTAssertEqual(weekday, "Sunday")
    }
    
    func testGetDurationHourAndMinute() {
        var start = "2017-09-06 11:11"
        var end = "2017-09-06 12:30"
        
        var duration: (hour: Int, minute: Int)?
        duration = DateUtility.getDurationHourAndMinute(start: start, end: end, format: .YMDHM)
        
        XCTAssertEqual(duration?.hour, 1)
        XCTAssertEqual(duration?.minute, 19)
        
        start = "2017-09-06 11:10"
        end = "2017-09-06 11:50"
        duration = DateUtility.getDurationHourAndMinute(start: start, end: end, format: .YMDHM)
        
        XCTAssertEqual(duration?.hour, 0)
        XCTAssertEqual(duration?.minute, 40)
        
        start = "2017-09-06 15:30"
        end = "2017-09-06 18:30"
        duration = DateUtility.getDurationHourAndMinute(start: start, end: end, format: .YMDHM)
        
        XCTAssertEqual(duration?.hour, 3)
        XCTAssertEqual(duration?.minute, 0)
        
        start = "2017-09-06 11:10"
        end = "2017-09-07 12:50"
        duration = DateUtility.getDurationHourAndMinute(start: start, end: end, format: .YMDHM)
        
        XCTAssertEqual(duration?.hour, 25)
        XCTAssertEqual(duration?.minute, 40)
    }
    
}

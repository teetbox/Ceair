//
//  FlightTabFlightTVCellViewModel.swift
//  Ceair
//
//  Created by Tong Tian on 9/4/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

class FlightTabFlightTVCellViewModel {

    let flight: Flight?
    
    var flightNo: String?
    var flightDate: String?
    var flightEquipment: String?
    var departureCity: String?
    var departureAirport: String?
    var departureAirportCode: String?
    var departureTime: String?
    var arrivalCity: String?
    var arrivalAirport: String?
    var arrivalAirportCode: String?
    var arrivalTime: String?
    var flyTime: String?
    
    init(flight: Flight?) {
        self.flight = flight
    }
    
    func configCell(completionHandler: () -> Void) {
        flightNo = flight?.flightNo
        flightEquipment = flight?.equipment

        departureCity = flight?.dCityName
        departureAirport = flight?.dAirportName
        departureAirportCode = flight?.dPort
        
        if let _departureTime = flight?.departureTime {
            let dateString = _departureTime.components(separatedBy: " ").first
            flightDate = dateString
            
            let date = DateUtility.getDate(from: dateString, format: .YMD)
            if let weekDay = DateUtility.getWeekDay(from: date) {
                flightDate?.append(", \(weekDay)")
            }
        
            departureTime = _departureTime.components(separatedBy: " ").last
        }
        
        
        arrivalCity = flight?.aCityName
        arrivalAirport = flight?.aAirportName
        arrivalAirportCode = flight?.aPort
        
        if let _arrivalTime = flight?.arrivalTime {
            let dateString = _arrivalTime.components(separatedBy: " ").last
            arrivalTime = dateString
        }
        
        flyTime = DateUtility.getDurationHours(start: flight?.departureTime, end: flight?.arrivalTime, format: .YMDHM)
        
        completionHandler()
    }
    
}

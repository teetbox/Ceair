//
//  FlightTabFlightTVCell.swift
//  Ceair
//
//  Created by Tong Tian on 9/1/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import UIKit

class FlightTabFlightTVCell: BaseTVCell {
    
    var viewModel: FlightTabFlightTVCellViewModel!
    
    let airportImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: IMAGES.Airport)
        return imageView
    }()
    
    let dateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: IMAGES.Date)
        return imageView
    }()
    
    let flightDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.white
        return label
    }()
    
    let ticketView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1, alpha: 1)
        return view
    }()
    
    override func setupViews() {
        backgroundColor = UIColor.clear
        
        addSubview(airportImageView)
        addSubview(dateImageView)
        addSubview(flightDateLabel)
        addSubview(ticketView)
        
        addConstraints(format: "H:|-10-[v0(23)]-7-[v1(13)]-[v2]", views: airportImageView, dateImageView, flightDateLabel)
        addConstraints(format: "V:|[v0(26)][v1(164)]", views: airportImageView, ticketView)
        addConstraints(format: "H:|-10-[v0]-10-|", views: ticketView)
        addConstraints(format: "V:[v0(11)]", views: dateImageView)
        dateImageView.centerYAnchor.constraint(equalTo: airportImageView.centerYAnchor).isActive = true
        flightDateLabel.centerYAnchor.constraint(equalTo: airportImageView.centerYAnchor).isActive = true
        
        setupTicketView()
    }
    
    let flightNoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.gray
        return label
    }()
    
    let departureAirportCodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = UIColor.fromHEX(string: "#1D3C5F")
        label.textAlignment = .left
        return label
    }()
    
    let arrivalAirportCodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = UIColor.fromHEX(string: "#1D3C5F")
        label.textAlignment = .right
        return label
    }()
    
    let flyTimeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.gray
        return label
    }()
    
    let departureAirportLabel: TopAlignLabel = {
        let label = TopAlignLabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let arrivalAirportLabel: TopAlignLabel = {
        let label = TopAlignLabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.darkGray
        label.textAlignment = .right
        label.numberOfLines = 0
        return label
    }()
    
    let departureTime: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor.darkGray
        label.textAlignment = .left
        return label
    }()
    
    let arrivalTime: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textColor = UIColor.darkGray
        label.textAlignment = .right
        return label
    }()

    private func setupTicketView() { // 13*11 74*7
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: IMAGES.Logo)
        
        let timeLineImageView = UIImageView()
        timeLineImageView.image = UIImage(named: IMAGES.TimeLine)
        
        let separateLineView = UIView()
        separateLineView.backgroundColor = UIColor.lightGray
        
        let checkInTimeButton = UIButton()
        checkInTimeButton.setTitle(LABELS.CheckInTime, for: .normal)
        checkInTimeButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        checkInTimeButton.setTitleColor(UIColor.gray, for: .normal)
        checkInTimeButton.setImage(UIImage(named: IMAGES.CheckInTime), for: .normal)
        checkInTimeButton.centerImageAndTitle(with: 5)
        
        ticketView.addSubview(logoImageView)
        ticketView.addSubview(flightNoLabel)
        ticketView.addSubview(departureAirportCodeLabel)
        ticketView.addSubview(arrivalAirportCodeLabel)
        ticketView.addSubview(timeLineImageView)
        ticketView.addSubview(flyTimeLabel)
        ticketView.addSubview(departureAirportLabel)
        ticketView.addSubview(arrivalAirportLabel)
        ticketView.addSubview(departureTime)
        ticketView.addSubview(arrivalTime)
        ticketView.addSubview(separateLineView)
        ticketView.addSubview(checkInTimeButton)
        
        ticketView.addConstraints(format: "H:|-12-[v0(13)]-5-[v1]", views: logoImageView, flightNoLabel)
        ticketView.addConstraints(format: "V:|-10-[v0(11)]-10-[v1(12)]-2-[v2(7)]-15-[v3(30)]-3-[v4(15)]-10-[v5(0.5)]-4-[v6(30)]", views: logoImageView, flyTimeLabel, timeLineImageView, departureAirportLabel, departureTime, separateLineView, checkInTimeButton)
        flightNoLabel.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor).isActive = true
        flyTimeLabel.centerXAnchor.constraint(equalTo: ticketView.centerXAnchor).isActive = true
        timeLineImageView.centerXAnchor.constraint(equalTo: ticketView.centerXAnchor).isActive = true
        
        ticketView.addConstraints(format: "H:|-12-[v0]-10-[v1(74)]", views: departureAirportCodeLabel, timeLineImageView)
        ticketView.addConstraints(format: "H:[v0]-10-[v1]-12-|", views: timeLineImageView, arrivalAirportCodeLabel)
        departureAirportCodeLabel.centerYAnchor.constraint(equalTo: timeLineImageView.centerYAnchor).isActive = true
        arrivalAirportCodeLabel.centerYAnchor.constraint(equalTo: timeLineImageView.centerYAnchor).isActive = true
        
        let halfWidth = frame.width / 2
        ticketView.addConstraints(format: "H:|-12-[v0]-\(halfWidth)-|", views: departureAirportLabel)
        ticketView.addConstraints(format: "H:|-\(halfWidth)-[v0]-12-|", views: arrivalAirportLabel)
        ticketView.addConstraints(format: "V:[v0(30)]", views: arrivalAirportLabel)
        arrivalAirportLabel.centerYAnchor.constraint(equalTo: departureAirportLabel.centerYAnchor).isActive = true
        
        ticketView.addConstraints(format: "H:|-12-[v0]", views: departureTime)
        ticketView.addConstraints(format: "H:[v0]-12-|", views: arrivalTime)
        ticketView.addConstraints(format: "V:[v0(15)]", views: arrivalTime)
        arrivalTime.centerYAnchor.constraint(equalTo: departureTime.centerYAnchor).isActive = true
        
        ticketView.addConstraints(format: "H:|[v0]|", views: separateLineView)
        checkInTimeButton.centerXAnchor.constraint(equalTo: ticketView.centerXAnchor).isActive = true
    }
    
    override func config() {
        viewModel.configCell {
            flightDateLabel.text = viewModel.flightDate
            flightNoLabel.text = viewModel.flightNo
            departureAirportCodeLabel.text = viewModel.departureAirportCode
            arrivalAirportCodeLabel.text = viewModel.arrivalAirportCode
            flyTimeLabel.text = viewModel.flyTime
            departureAirportLabel.text = viewModel.departureAirport
            arrivalAirportLabel.text = viewModel.arrivalAirport
            departureTime.text = viewModel.departureTime
            arrivalTime.text = viewModel.arrivalTime
        }
    }
    
}

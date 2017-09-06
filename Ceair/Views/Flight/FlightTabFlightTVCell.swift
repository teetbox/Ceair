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
        imageView.image = UIImage(named: Images.Airport)
        return imageView
    }()
    
    let dateImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Images.Date)
        return imageView
    }()
    
    let flightDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.white
        label.text = "2018-08-08, Fri"
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
        addConstraints(format: "V:|[v0(26)][v1(134)]", views: airportImageView, ticketView)
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
        label.text = "MU2155 | 320"
        return label
    }()
    
    let departureAirportCodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = UIColor.fromHEX(string: "#1D3C5F")
        label.textAlignment = .left
        label.text = "XIA"
        return label
    }()
    
    let arrivalAirportCodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = UIColor.fromHEX(string: "#1D3C5F")
        label.textAlignment = .right
        label.text = "SHA"
        return label
    }()
    
    let timeLineLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.gray
        label.text = "2H 50M"
        return label
    }()
    
    let departureAirportLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Xi an Xian Yang"
        return label
    }()
    
    let arrivalAirportLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.black
        label.textAlignment = .right
        label.numberOfLines = 0
        label.text = "Shang Hai Hong Qiao"
        return label
    }()

    private func setupTicketView() { // 13*11 74*7
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: Images.Logo)
        
        let timeLineImageView = UIImageView()
        timeLineImageView.image = UIImage(named: Images.TimeLine)
        
        ticketView.addSubview(logoImageView)
        ticketView.addSubview(flightNoLabel)
        ticketView.addSubview(departureAirportCodeLabel)
        ticketView.addSubview(arrivalAirportCodeLabel)
        ticketView.addSubview(timeLineImageView)
        ticketView.addSubview(timeLineLabel)
        ticketView.addSubview(departureAirportLabel)
        ticketView.addSubview(arrivalAirportLabel)
        
        ticketView.addConstraints(format: "H:|-12-[v0(13)]-5-[v1]", views: logoImageView, flightNoLabel)
        ticketView.addConstraints(format: "V:|-10-[v0(11)]-10-[v1(12)]-2-[v2(7)]-10-[v3(30)]", views: logoImageView, timeLineLabel, timeLineImageView, departureAirportLabel)
        flightNoLabel.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor).isActive = true
        timeLineLabel.centerXAnchor.constraint(equalTo: ticketView.centerXAnchor).isActive = true
        timeLineImageView.centerXAnchor.constraint(equalTo: ticketView.centerXAnchor).isActive = true
        
        ticketView.addConstraints(format: "H:|-12-[v0]-10-[v1(74)]", views: departureAirportCodeLabel, timeLineImageView)
        ticketView.addConstraints(format: "H:[v0]-10-[v1]-12-|", views: timeLineImageView, arrivalAirportCodeLabel)
        departureAirportCodeLabel.centerYAnchor.constraint(equalTo: timeLineImageView.centerYAnchor).isActive = true
        arrivalAirportCodeLabel.centerYAnchor.constraint(equalTo: timeLineImageView.centerYAnchor).isActive = true
        
        let halfWidth = frame.width / 2 - 10
        ticketView.addConstraints(format: "H:|-12-[v0]-\(halfWidth)-|", views: departureAirportLabel)
        ticketView.addConstraints(format: "H:|-\(halfWidth)-[v0]-12-|", views: arrivalAirportLabel)
        arrivalAirportLabel.centerYAnchor.constraint(equalTo: departureAirportLabel.centerYAnchor).isActive = true
    }
    
    override func config() {
        viewModel.configCell {
            flightDateLabel.text = viewModel.flightDate
        }
    }
    
}

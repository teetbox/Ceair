//
//  FlightTabFlightTVCell.swift
//  Ceair
//
//  Created by Tong Tian on 9/1/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import UIKit

class FlightTabFlightTVCell: BaseTVCell {
    
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
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.white
        label.text = "2018-08-08"
        return label
    }()
    
    let ticketView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 1.0, alpha: 0.2)
        return view
    }()
    
    override func setupViews() {
        backgroundColor = UIColor.clear
        
        addSubview(airportImageView)
        addSubview(dateImageView)
        addSubview(dateLabel)
        addSubview(ticketView)
        
        addConstraints(format: "H:|-10-[v0(23)]-7-[v1(13)]-[v2]", views: airportImageView, dateImageView, dateLabel)
        addConstraints(format: "V:|[v0(26)][v1(134)]", views: airportImageView, ticketView)
        addConstraints(format: "H:|-10-[v0]-10-|", views: ticketView)
        addConstraints(format: "V:[v0(11)]", views: dateImageView)
        dateImageView.centerYAnchor.constraint(equalTo: airportImageView.centerYAnchor).isActive = true
        dateLabel.centerYAnchor.constraint(equalTo: airportImageView.centerYAnchor).isActive = true
        
    }

}

//
//  User.swift
//  Ceair
//
//  Created by Tong Tian on 9/8/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

struct User: Codable {
    let addresses: String?
    let connects: String?
    let connectPeople: String?
    let usertype: String?
    let customerid: String?
    let loginname: String?
    let password: String?
    let hasTxnPin: String?
    let fullname: String?
    let idtype: String?
    let idno: String?
    let sex: String?
    let mobileno: String?
    let email: String?
    let memberShipStatus: String?
    let source: String?
    let memberlvl: String?
    let membertitle: String?
    let membermiles: String?
    let ffpno: String?
    let nationality: String?
    let pid: String?
    let tier: String?
    let accountStatus: String?
    let cnname: String?
    let birthday: String?
    let enGivenname: String?
    let enFamilyname: String?
    let pinType: String?
    let transactionPasswordStatus: String?
    let remainConumsePoint: String?
    let centificateObjs: [Centificate]?
}

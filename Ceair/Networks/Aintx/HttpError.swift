//
//  HttpError.swift
//  Ceair
//
//  Created by Tong Tian on 9/21/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import Foundation

enum HttpError: Error {
    
    case invalidURL(String)
    case encordingFailed(EncordingFailedReason)
    
    enum EncordingFailedReason {
        case missingParameters(String)
        case invalidParameters(String)
    }
    
}

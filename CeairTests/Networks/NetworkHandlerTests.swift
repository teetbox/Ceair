//
//  NetworkHandlerTests.swift
//  CeairTests
//
//  Created by Tong Tian on 9/18/17.
//  Copyright © 2017 Bizersoft. All rights reserved.
//

import XCTest
@testable import Ceair

class NetworkHandlerTests: XCTestCase {

    func testGetRequestInfo() {
        let requestInfo = NetworkHandler.GetRequestInfo
        
        XCTAssertEqual(requestInfo[NETWORKS.Domain], URLS.Domain)
        XCTAssertEqual(requestInfo[NETWORKS.MethodKey], NETWORKS.MethodValue.Get)
        XCTAssertEqual(requestInfo[NETWORKS.SessionKey], NETWORKS.SessionValue.Standard)
        XCTAssertEqual(requestInfo[NETWORKS.RequestKey], NETWORKS.RequestValue.Data)
    }
    
    func testPostRequestInfo() {
        let requestInfo = NetworkHandler.PostRequestInfo
        
        XCTAssertEqual(requestInfo[NETWORKS.Domain], URLS.Domain)
        XCTAssertEqual(requestInfo[NETWORKS.MethodKey], NETWORKS.MethodValue.Post)
        XCTAssertEqual(requestInfo[NETWORKS.SessionKey], NETWORKS.SessionValue.Standard)
        XCTAssertEqual(requestInfo[NETWORKS.RequestKey], NETWORKS.RequestValue.Data)
    }
    
    func testPerformHttpRequestMissingEndPoint() {
        let requestInfo = NetworkHandler.GetRequestInfo
        
        NetworkHandler.performHttpRequest(requestInfo: requestInfo) { (responseInfo) in
            let error = responseInfo[NETWORKS.Error] as? NetworkError
            XCTAssertEqual(error?.localizedDescription, "Request Failed: Missing requestInfo 'endpoint'")
        }
    }
    
    func testPerformHttpRequestMissingHost() {
        var requestInfo = NetworkHandler.GetRequestInfo
        requestInfo[NETWORKS.Endpoint] = "biubiu"
        requestInfo[NETWORKS.Domain] = nil
        
        NetworkHandler.performHttpRequest(requestInfo: requestInfo) { (responseInfo) in
            let error = responseInfo[NETWORKS.Error] as? NetworkError
            XCTAssertEqual(error?.localizedDescription, "Request Failed: Missing requestInfo 'domain'")
        }
    }
    
    func testPerformHttpRequestMissingMethodKey() {
        var requestInfo = NetworkHandler.GetRequestInfo
        requestInfo[NETWORKS.Endpoint] = "biubiu"
        requestInfo[NETWORKS.MethodKey] = nil
        
        NetworkHandler.performHttpRequest(requestInfo: requestInfo) { (responseInfo) in
            let error = responseInfo[NETWORKS.Error] as? NetworkError
            XCTAssertEqual(error?.localizedDescription, "Request Failed: Missing requestInfo 'methodType'")
        }
    }
    
    func testPerformHttpRequestMissingRequestKey() {
        var requestInfo = NetworkHandler.GetRequestInfo
        requestInfo[NETWORKS.Endpoint] = "biubiu"
        requestInfo[NETWORKS.RequestKey] = nil
        
        NetworkHandler.performHttpRequest(requestInfo: requestInfo) { (responseInfo) in
            let error = responseInfo[NETWORKS.Error] as? NetworkError
            XCTAssertEqual(error?.localizedDescription, "Request Failed: Missing requestInfo 'requestType'")
        }
    }
    
    func testPerformHttpRequestMissingSessionKey() {
        var requestInfo = NetworkHandler.GetRequestInfo
        requestInfo[NETWORKS.Endpoint] = "biubiu"
        requestInfo[NETWORKS.SessionKey] = nil
        
        NetworkHandler.performHttpRequest(requestInfo: requestInfo) { (responseInfo) in
            let error = responseInfo[NETWORKS.Error] as? NetworkError
            XCTAssertEqual(error?.localizedDescription, "Request Failed: Missing requestInfo 'sessionType'")
        }
    }
    
    func testPerformHttpRequestUnsupportedMethod() {
        var requestInfo = NetworkHandler.GetRequestInfo
        requestInfo[NETWORKS.Endpoint] = "biubiu"
        requestInfo[NETWORKS.MethodKey] = "PPT"
        
        NetworkHandler.performHttpRequest(requestInfo: requestInfo) { (responseInfo) in
            let error = responseInfo[NETWORKS.Error] as? NetworkError
            XCTAssertEqual(error?.localizedDescription, "Request Failed: Unsupported http method 'PPT'")
        }
    }
    
    func testPerformHttpRequestUnsupportedRequest() {
        var requestInfo = NetworkHandler.GetRequestInfo
        requestInfo[NETWORKS.Endpoint] = "biubiu"
        requestInfo[NETWORKS.RequestKey] = "PPT"
        
        NetworkHandler.performHttpRequest(requestInfo: requestInfo) { (responseInfo) in
            let error = responseInfo[NETWORKS.Error] as? NetworkError
            XCTAssertEqual(error?.localizedDescription, "Request Failed: Unsupported request type 'PPT'")
        }
    }
    
    func testPerformHttpRequestUnsupportedSession() {
        var requestInfo = NetworkHandler.GetRequestInfo
        requestInfo[NETWORKS.Endpoint] = "biubiu"
        requestInfo[NETWORKS.SessionKey] = "PPT"
        
        NetworkHandler.performHttpRequest(requestInfo: requestInfo) { (responseInfo) in
            let error = responseInfo[NETWORKS.Error] as? NetworkError
            XCTAssertEqual(error?.localizedDescription, "Request Failed: Unsupported session type 'PPT'")
        }
    }
    
    func testPerformHttpRequestBackgroundSessionWithoutIdentifier() {
        var requestInfo = NetworkHandler.GetRequestInfo
        requestInfo[NETWORKS.Endpoint] = "biubiu"
        requestInfo[NETWORKS.SessionKey] = NETWORKS.SessionValue.Background
        
        NetworkHandler.performHttpRequest(requestInfo: requestInfo) { (responseInfo) in
            let error = responseInfo[NETWORKS.Error] as? NetworkError
            XCTAssertEqual(error?.localizedDescription, "Request Failed: Missing requestInfo 'identifier'")
        }
    }
    
}

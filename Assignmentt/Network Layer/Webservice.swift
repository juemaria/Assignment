//
//  Webservice.swift
//  Assignment
//
//  Created by Jue Maria on 12/22/20.
//  Copyright © 2020 gehqw. All rights reserved.
//

import Foundation
//Setting BaseURL
class Endpoint
{
    static let instance = Endpoint()
    private var baseurl: String = "https://hotels-com-free.p.rapidapi.com"
    private var Key:String = "a8b2b587d2mshcebc951c3e54bbbp111554jsn6e14971645ef"
    func setEndpointAndKey(endPoint:String,Key:String) -> Bool
    {
        self.baseurl = endPoint
        self.Key = Key
        return true
    }
    func getEndpoint() -> String
    {
        let apiEndpoint = baseurl
        
        return apiEndpoint
    }
    func getAPIKey() -> String
    {
        let apiKey = Key
        return apiKey
    }
    
}

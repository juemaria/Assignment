//
//  APIRequest.swift
//  Assignment
//
//  Created by Jue Maria on 12/22/20.
//  Copyright © 2020 gehqw. All rights reserved.
//

import Foundation
import Alamofire
import UIKit

class APIServiceRequest:Endpoint
{
    static let instances = APIServiceRequest()
    //API Service Call
    func GetDetails(Api:String!,Method:Alamofire.HTTPMethod,Parameter: [String:Any]?,completion: @escaping (Data?,String?)->())
        {
            var URLstring :String?
            if Api.isEmpty == false
            {
                URLstring = "\(Endpoint.instance.getEndpoint())\(Api!)"
            }
            else{
              URLstring = "\(Endpoint.instance.getEndpoint())"
            }
            let header : [String:String] = ["x-rapidapi-key" : "\(getAPIKey())"]
            Alamofire.request(URLstring!, method: Method, parameters: Parameter, encoding:JSONEncoding.default, headers: header).responseJSON(completionHandler: {(responses) in
                if let data = responses.data {
                    completion(data,nil)
                } else {
                    completion(nil,"error")
                }
            })
        }
}

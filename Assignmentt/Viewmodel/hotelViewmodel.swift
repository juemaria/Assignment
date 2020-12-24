//
//  hotelViewmodel.swift
//  Assignment
//
//  Created by Jue Maria on 12/22/20.
//  Copyright © 2020 gehqw. All rights reserved.
//

import Foundation
class HotelViewmodel:NSObject
{
    private(set) var hotelobject : [HotelResponse]! {
          didSet {
              self.bindHotelViewModelToController()
          }
      }
    private(set) var Message : String! {
           didSet {
               self.bindHotelViewModelToController()
           }
       }
      var bindHotelViewModelToController : (() -> ()) = {}

      override init() {
          super.init()
      }
     //API Call
    func callFuncToGethotelData(searchPlace:String) {
    APIServiceRequest.instances.GetDetails(Api:"/suggest/v1.7/json?query=\(searchPlace)&locale=en_US", Method: .get, Parameter: nil,completion: {(data,Error) in
            let hotel = try? JSONDecoder().decode(Response.self, from: data!)
           if hotel != nil
            {
                let filteredHotelDetails = hotel!.suggestions!.filter {
                    $0.group == "HOTEL_GROUP"
                }
                self.hotelobject = filteredHotelDetails
            }
            else
            {
                do {
                    // make sure this JSON is in the format we expect
                    if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any] {
                        // try to read out a string array
                        if let Message = json["message"] as? String {
                            self.Message = Message
                        }
                    }
                } catch let error as NSError {
                    self.Message = "\(error.localizedDescription)"
                }
            }
            
           })
      }
  }

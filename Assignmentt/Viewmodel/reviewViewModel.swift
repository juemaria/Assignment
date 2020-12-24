//
//  reviewViewModel.swift
//  Assignmentt
//
//  Created by Jue Maria on 12/23/20.
//  Copyright © 2020 test. All rights reserved.
//

import Foundation

class HotelReviewViewmodel:NSObject
{
    private(set) var hotelReviewobject : [Reviews]! {
        didSet {
            self.bindHotelReviewViewModelToController()
        }
    }
    private(set) var Message : String! {
        didSet {
            self.bindHotelReviewViewModelToController()
        }
    }
    var bindHotelReviewViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
    }
    
    func callFuncToGethotelData(HotelID:String) {
        APIServiceRequest.instances.GetDetails(Api: "/mobile_service/property-content/v1/hotels.com/property/\(HotelID)/reviews?loc=en_US", Method: .get, Parameter: nil, completion: {(data,Error) in
let hotelReview = try? JSONDecoder().decode(HotelReviewResponse.self, from: data!)
            if hotelReview != nil
            {
                self.hotelReviewobject = hotelReview?.reviewData?.guestReviewGroups?.guestReviews![0].reviews
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
                    print("Failed to load: \(error.localizedDescription)")
                }
            }
        })
    }
}

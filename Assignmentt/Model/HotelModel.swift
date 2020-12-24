//
//  HotelModel.swift
//  Assignment
//
//  Created by Jue Maria on 12/22/20.
//  Copyright © 2020 gehqw. All rights reserved.
//

import Foundation

struct Response:Codable
{
    var suggestions : [HotelResponse]?
    
    enum CodingKeys:String,CodingKey
    {
        case suggestions
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        suggestions = try values.decodeIfPresent([HotelResponse].self, forKey: .suggestions)
    }
}
struct HotelResponse:Codable
{
    var group :String?
    var entities : [hotel_Model]?
    
    enum CodingKeys:String,CodingKey
    {
        case group
        case entities
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        group = try values.decodeIfPresent(String.self, forKey: .group)
        entities = try values.decodeIfPresent([hotel_Model].self, forKey:.entities)
    }
}
struct hotel_Model:Codable
{
    var name :String?
    var destinationId :String?
     var caption :String?
    enum CodingKeys:String,CodingKey
    {
        case name
        case destinationId
        case caption
    }
    
    init(from decoder: Decoder) throws {
               let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
       
            destinationId = try values.decodeIfPresent(String.self, forKey: .destinationId)
       
            caption = try values.decodeIfPresent(String.self, forKey: .caption)
           }
    }
    

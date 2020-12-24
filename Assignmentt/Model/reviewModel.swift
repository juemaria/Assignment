//
//  reviewModel.swift
//  Assignmentt
//
//  Created by Jue Maria on 12/23/20.
//  Copyright © 2020 test. All rights reserved.
//

import Foundation
struct HotelReviewResponse:Codable
{
    var reviewData : ReviewDatas?

    enum CodingKeys:String,CodingKey
    {
        case reviewData
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        reviewData = try values.decodeIfPresent(ReviewDatas.self, forKey: .reviewData)
    }
}

struct ReviewDatas:Codable
{
    var guestReviewGroups : GuestReviewGroups?

    enum CodingKeys:String,CodingKey
    {
        case guestReviewGroups
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        guestReviewGroups = try values.decodeIfPresent(GuestReviewGroups.self, forKey: .guestReviewGroups)
    }
}

struct GuestReviewGroups:Codable
{
    var guestReviews : [GuestReviews]?

    enum CodingKeys:String,CodingKey
    {
        case guestReviews
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        guestReviews = try values.decodeIfPresent([GuestReviews].self, forKey: .guestReviews)
    }
}

struct GuestReviews:Codable
{
    var reviews : [Reviews]?
    
    enum CodingKeys:String,CodingKey
    {
        case reviews
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        reviews = try values.decodeIfPresent([Reviews].self, forKey: .reviews)
    }
}
struct Reviews:Codable
{
    var recommendedBy = "Unknown"
    var qualitativeBadgeText : String?
    var formattedRating : String?
    var title : String?
    var summary : String?

    enum CodingKeys:String,CodingKey
    {
        case recommendedBy
        case qualitativeBadgeText
        case formattedRating
        case summary
        case title
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        recommendedBy = try values.decode(String.self, forKey: .recommendedBy)
        qualitativeBadgeText = try values.decodeIfPresent(String.self, forKey: .qualitativeBadgeText)
        formattedRating = try values.decodeIfPresent(String.self, forKey:.formattedRating)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        summary = try values.decodeIfPresent(String.self, forKey: .summary)
    }
}

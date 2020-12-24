//
//  Error.swift
//  Assignment
//
//  Created by Jue Maria on 12/22/20.
//  Copyright © 2020 gehqw. All rights reserved.
//

import Foundation

enum CustomErrors: String, Error {
    case authorize = "Unable to authenticate user. Please check your connection and try again."
    case unavailableServer = "Server is unavailable"
}

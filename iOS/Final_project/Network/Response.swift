//
//  Response.swift
//  Final_project
//
//  Created by yves on 2019-12-07.
//  Copyright © 2019 evanlou. All rights reserved.
//

import Foundation

struct LoginDataResponse: Codable {
    var email: String
    var password: String
    var remember: Bool
}

struct LoginResponse: Codable {
    var data: LoginDataResponse
    var success: Bool
}



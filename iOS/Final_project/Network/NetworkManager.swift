//
//  NetworkManager.swift
//  Launch
//
//  Created by yifeng Shi on 12/6/19.
//  Copyright © 2019 Yifeng. All rights reserved.
//

import Foundation
import Alamofire

let signUpEndPoint = "http://35.237.54.112/api/signup"

let loginEndPoint = "http://35.237.54.112/api/login"

class NetworkManager {
    // make a HTTP request to the signUpEndPoint
    static func postLogin(email: String, password: String, completion: @escaping (Bool?) -> Void) {
        // headers to be sent in the post request if required
        
        // parameters that are needed to be posted
        var ifSuccess: Bool?
        let params = [
            "email": email,
            "password": password,
            "remember": false
        ] as [String : Any]
        // POST method
        Alamofire.request(loginEndPoint, method: .post, parameters: params as Parameters, encoding: JSONEncoding.default).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                
                if let loginData = try?
                    jsonDecoder.decode(LoginResponse.self, from: data) {
                    let res = loginData.success
                    ifSuccess = res
                    completion(res)
                    }
            case .failure(_):
                if let httpStatusCode = response.response?.statusCode {
                    switch httpStatusCode {
                    case 422:
                        ifSuccess = false
                        completion(false)
                    default:
                        completion(ifSuccess)
                    }
                } else {
                    completion(ifSuccess)
                }
            }
        }
//        return ifSuccess
}
    
    static func postSignUp(username: String, password: String, email: String) {
        let params = [
            "username": username,
            "password": password,
            "email": email
        ] as [String : String]
        
        Alamofire.request(signUpEndPoint, method: .post, parameters: params as Parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: { (response) in
        })
    }
}

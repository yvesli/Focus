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
    static func postLogin(email: String, password: String) {
        // headers to be sent in the post request if required
        
        // parameters that are needed to be posted
        let params = [
            "email": email,
            "password": password
        ] as [String : String]
        // POST method

//
        Alamofire.request(loginEndPoint, method: .post, parameters: params as Parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            print(response)
        }
        
//        // GET method WORKABLE
//        Alamofire.request(loginEndPoint, method: .get, parameters: params, headers: nil).validate().responseData { (response) in
//            switch response.result {
//            case .success(let data):
//                print("success")
//                if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
//                    print(json)
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
    }
    
    static func postSignUp(username: String, password: String, email: String) {
        let params = [
            "username": username,
            "password": password,
            "email": email
        ] as [String : String]
        
        Alamofire.request(signUpEndPoint, method: .post, parameters: params as Parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: { (response) in
            print(response)
        })
    }
    
    
}

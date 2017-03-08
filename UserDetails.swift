//
//  UserDetails.swift
//  API Task
//
//  Created by Sierra 4 on 06/03/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
        var statusCode: Int?
        var msg: String?
        var profile: Profile?
        
        required init?(map: Map){
            statusCode <- map["status_code"]
            msg <- map["msg"]
            profile <- map["profile"]
        }
        
        func mapping(map: Map){
            statusCode <- map["status_code"]
            msg <- map["msg"]
            profile <- map["profile"]
        }
    }
    
    
    class Profile: Mappable {
        var username: String?
        var emailId: String?
        var password: String?
        var phone: String?
        var country: String?
        var city: String?
        var address: String?
        
        required init?(map: Map){
            username <- map["username"]
            phone <- map["phone"]
            emailId <- map["email"]
            password <- map["password"]
            phone <- map["phone"]
            country <- map["country"]
            address <- map["address"]
           city <- map["city"]
        }
        
        func mapping(map: Map){
            username <- map["username"]
            phone <- map["phone"]
            emailId <- map["email"]
            password <- map["password"]
            phone <- map["phone"]
            country <- map["country"]
            address <- map["address"]
            city <- map["city"]
        }
    }

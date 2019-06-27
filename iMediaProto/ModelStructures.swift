//
//  ModelStructures.swift
//  iMediaProto
//
//  Created by Habib on 6/27/19.
//  Copyright © 2019 a. All rights reserved.
//
import Foundation
import Alamofire

struct ResponseSuccessful: Codable {
    
    let token: String?
//    let loginStatus: String?
//    let message: String?
//    let loginSession: String?
//    let loginName: String?
//    let loginEmail: String?
//    let loginLanguage: String?
    
    private enum CodingKeys: String, CodingKey {
   
        case token
//        case loginStatus = "login_status"
//        case message
//        case loginName = "login_name"
//        case loginEmail = "login_email"
//        case loginSession = "login_session"
//        case loginLanguage = "login_language"
        
    }
}



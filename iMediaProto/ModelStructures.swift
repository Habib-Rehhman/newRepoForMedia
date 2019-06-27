//
//  ModelStructures.swift
//  iMediaProto
//
//  Created by Habib on 6/27/19.
//  Copyright © 2019 a. All rights reserved.
//
import Foundation
import Alamofire

struct signinStructure: Codable {

    let loginStatus: Bool?
    let message: String
    let loginSession: String?
    let loginName: String?
    let loginEmail: String?
    let loginLanguage: String?
    
    private enum CodingKeys: String, CodingKey {

        case loginStatus = "login_status"
        case message
        case loginName = "login_name"
        case loginEmail = "login_email"
        case loginSession = "login_session"
        case loginLanguage = "login_language"
        
    }
}

struct signUpStructure: Codable{
    
    let signupStatus: Bool?
    let message: String
    let takeAction: String?
    let userEmail: String?
    
    private enum CodingKeys: String, CodingKey {
        
        case signupStatus = "signup_status"
        case message
        case takeAction = "take_action"
        case userEmail = "user_email"
        
    }
}

struct networkConstants{
    
    static let baseURL = "http://192.168.1.122/wikibolics/"
    static let login = "login.php"
    static let signup = "signup.php"
    static let nextToLogin = "chapters.php"
}

struct chapter: Codable{
    
    let id: String
    let part: String
    let name: String
}

struct arrayOfChapters: Codable{
    
    let message: String?
    let chaptersList: [chapter]?
}

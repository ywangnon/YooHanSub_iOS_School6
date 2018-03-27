//
//  Data.swift
//  ProjectSample
//
//  Created by Hansub Yoo on 2018. 3. 27..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

struct user: Decodable {
    var user: User
    var token: String
    
    private enum CodingKeys: String, CodingKey {
        case user
        case token
    }
    
    struct User: Decodable {
        let username: String
        let firstname: String
        let lastname: String
        let email: String
        
        private enum CodingKeys: String, CodingKey {
            case username
            case firstname = "first_name"
            case lastname = "last_name"
            case email
        }
    }
}


struct postlist: Decodable {
    var images: [String]
    var title: String
    var imgcover: String?
    var content: String
    var createdate: String
    var author: user.User
    
    private enum CodingKeys: String, CodingKey {
        case images
        case title
        case imgcover = "img_cover"
        case content
        case createdate = "created_date"
        case author
    }
}

//
//  UserDataModel.swift
//  LoginProject
//
//  Created by Hansub Yoo on 2018. 2. 26..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

//아이디
//비밀번호
//이메일
//생일
//성별

import Foundation

enum Gender: Int {
    case Man = 0
    case Girl = 1
}

struct UserDataModel {
    var userID: String
    var userPW: String
    var email: String
    var birthDay: String?
    var gender: Gender?
    
    var friendsList: [UserDataModel]?
    
    init? (dic: [String: Any])
    {
        guard let id = dic["userID"] as? String else { return nil }
        guard let pw = dic["userPW"] as? String else { return nil }
        guard let email = dic["email"] as? String else { return nil }
        
        self.userID = id
        self.userPW = pw
        self.email = email
        
        self.birthDay = dic["birthDay"] as? String
        if let genderNum = dic["gender"] as? Int
        {
            gender = Gender(rawValue: genderNum)
        }
        
        if let list = dic["friendsList"] as? [[String:Any]]
        {
            for dict in list
            {
                friendsList?.append(UserDataModel(dic: dict)!)
            }
        }
    }
}

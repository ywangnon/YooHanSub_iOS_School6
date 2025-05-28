//
//  UserDataCenter.swift
//  LoginProject
//
//  Created by Hansub Yoo on 2018. 2. 26..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

class UserDataCenter {
    
    static var main: UserDataCenter = UserDataCenter()
    
    private init() {
        
    }
    
    private var userList: [String] = []
    
    var isLogin: Bool?
    
    func login(userID: String, userPw: String) -> Bool {
        return true
    }
    
    
}

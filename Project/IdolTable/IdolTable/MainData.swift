//
//  MainData.swift
//  IdolTable
//
//  Created by Hansub Yoo on 2018. 2. 28..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

class MainDataCenter {
    
    static var sharedInstance: MainDataCenter = MainDataCenter()
    
    var friendList: [[String:String]]?
    
    var UserListModel:[UserModel]
    {
        var list:[UserModel] = []
        
        for dic in friendList!
        {
            list.append(UserModel(with: dic)!)
        }
        return list
    }
    
    
    var friendListCount: Int{
        if let count = friendList?.count
        {
            return count
        }else
        {
            return 0
        }
    }
    
    private init() {
        loadFileFriendList()
    }
    
    private func loadFileFriendList()
    {
        guard let path = Bundle.main.path(forResource: "FriendInfo", ofType: "plist") else {return}
        if let data = try? Data(contentsOf: URL(fileURLWithPath: path)), let dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? [[String:String]]
        {
            friendList = dic
        }
    }
    
    func friendData(with index: Int) -> UserModel {
        let dic = friendList![index]
        return UserModel(with: dic)!
    }
}

/*
<key>PhoneNumber</key>
<string>010-1234-5678</string>
<key>ProfileImage</key>
<string>ProfileImage1</string>
<key>MyProfileDescription</key>
<string>프로듀스 101의 피지컬 甲 진중함과 코믹함, 카리스마와 귀여움이 공존하는 프리스틴의 리더 그리고 영원히 기억될 I.O.I의 리더</string>
<key>Account</key>
<string>user1</string>
<key>Password</key>
<string>user1</string>
<key>BackgroundImage</key>
<string>BackImage1</string>
<key>StatusDescription</key>
<string>다이어트중</string>
<key>Nickname</key>
<string>강미나</string>
<key>Email</key>
<string>mnkang123@fastcampus.co.kr</string>
*/

struct UserModel {
    
    var profileImgUrl: String
    var profileDescription: String
    var bgImgUrl: String
    var statusDescription: String
    var nickName: String
    var phoneNumber: String
    var email: String
    
    init?(with dic: [String:String]) {
        guard let profileImgUrl = dic["ProfileImage"] else {return nil}
        guard let profileDescription = dic["MyProfileDescription"] else {return nil}
        guard let bgImgUrl = dic["BackgroundImage"] else {return nil}
        guard let statusDescription = dic["StatusDescription"] else {return nil}
        guard let nickName = dic["Nickname"] else {return nil}
        guard let phoneNumber = dic["PhoneNumber"] else {return nil}
        guard let email = dic["Email"] else {return nil}
        
        self.profileImgUrl = profileImgUrl
        self.profileDescription = profileDescription
        self.bgImgUrl = bgImgUrl
        self.statusDescription = statusDescription
        self.nickName = nickName
        self.phoneNumber = phoneNumber
        self.email = email
    }
}

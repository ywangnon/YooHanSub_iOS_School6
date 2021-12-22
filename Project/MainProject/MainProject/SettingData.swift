//
//  SettingData.swift
//  IdolTable
//
//  Created by Hansub Yoo on 2018. 2. 28..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

class SettingDataCenter {
    
    static var standard: SettingDataCenter = SettingDataCenter()
    
    var settingList: [[String:Any]]?
    
    private init() {
        loadFromSettings()
    }
    
    private func loadFromSettings() {
        
        guard let path = Bundle.main.path(forResource: "Settings", ofType: "plist") else {return}
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: path)), let dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? [[String:Any]]
        {
            settingList = dic
        }
    }
}


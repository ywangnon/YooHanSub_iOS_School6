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
    
    func rowsForASection(of section: Int) -> Int {
        
        let rowForSection = settingList![section].count
        
        return rowForSection
    }
    
    func titleOfSections(_ section: Int) -> String {
        
//        let title: String = settingList![section]["SectionTitle"] as! String
        let sectionCount = settingList![section]
        print("====section======")
        print(sectionCount)
        print("sectionEnd================")
        return "title"
    }
    
    
    
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

struct SettingData {
    
}

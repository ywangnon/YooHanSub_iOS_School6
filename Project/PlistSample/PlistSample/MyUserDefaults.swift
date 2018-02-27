//
//  MyUserDefaults.swift
//  PlistSample
//
//  Created by Hansub Yoo on 2018. 2. 27..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

class MyUserDefaults {

    func object(forKey defaultName: String) -> Any?
    {
        let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let fullPath = rootPath + "/MyUserDefaults.plist"
        
        if !FileManager.default.fileExists(atPath: fullPath)
        {
            if let bundlePath = Bundle.main.path(forResource: "MyUserDefaults", ofType: "plist")
            {
                try? FileManager.default.copyItem(atPath: bundlePath, toPath: fullPath)
            }
        }
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: fullPath)),
            var dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as! [String:Any]
        {
            let newData = dic[defaultName]
            print("MyUserDefaults Object")
            print(newData)
            print("=======================")
            print("MyUserDefaults Object full")
            print(dic)
            print("=======================")
            return newData
        }
        
        return nil
    }
    
    open func set(_ value: Any?, forKey defaultName: String)
    {
        let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let fullPath = rootPath + "/MyUserDefaults.plist"
        
        if !FileManager.default.fileExists(atPath: fullPath) {
            if let bundlePath = Bundle.main.path(forResource: "MyUserDefaults", ofType: "plist")
            {
                try? FileManager.default.copyItem(atPath: bundlePath, toPath: fullPath)
            }
        }
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: fullPath)),
            var dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as! [String:Any]
        {
            print("MyUserDefaults set before")
            print(dic)
            print("=======================")
            dic[defaultName] = value
            print("MyUserDefaults set after")
            print(dic)
            let newData = try? PropertyListSerialization.data(fromPropertyList: dic, format: .xml, options: 0)
            try? newData?.write(to: URL(fileURLWithPath: fullPath))
        }
    }
    
    open func removeObject(forKey defaultName: String)
    {
        let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let fullPath = rootPath + "/MyUserDefaults.plist"
        
        if !FileManager.default.fileExists(atPath: fullPath) {
            if let bundlePath = Bundle.main.path(forResource: "MyUserDefaults", ofType: "plist")
            {
                try? FileManager.default.copyItem(atPath: bundlePath, toPath: fullPath)
            }
        }
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: fullPath)),
            var dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as! [String:Any]
        {
            print("MyUserDefaults remove before")
            print(dic)
            print("=======================")
            dic.removeValue(forKey: defaultName)
            print("MyUserDefaults remove after")
            print(dic)
            let newData = try? PropertyListSerialization.data(fromPropertyList: dic, format: .xml, options: 0)
            try? newData?.write(to: URL(fileURLWithPath: fullPath))
        }
    }
}

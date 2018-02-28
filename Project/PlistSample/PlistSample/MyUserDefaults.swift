//
//  MyUserDefaults.swift
//  PlistSample
//
//  Created by Hansub Yoo on 2018. 2. 27..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

class MyUserDefaults {
    
    //1. plist파일 위치 파악
    //1-1. 파일 확인해서 없을 시
    //2. 파일 있다면 읽어오기 data -> dictionary
    //3. 저장시에는 dictionary -> data(xml)
    
    let fileName = "myUserDefault.plist"
    private var fullPath: String
    private var fullURL: URL
    
    static var standard: MyUserDefaults = MyUserDefaults()
    
    private init() {
        let directoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        fullPath = directoryPath + "/" + fileName
        fullURL = URL(fileURLWithPath: fullPath)
    }
    
    open func object(forKey defaultName: String) -> Any?
    {
        if !FileManager.default.fileExists(atPath: fullPath)
        {
            return nil
        }
        
        let data = try! Data(contentsOf: fullURL)
        
        let propertyList = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
        //로직이 틀리면 안되기 때문에, 틀렸다면 set에서 코드를 잘못 짜서 잘못 입력 된 것이기 떄문에
        let dic = propertyList as! [String:Any?]
        if let value = dic[defaultName]
        {
            return value
        }else
        {
            return nil
        }
//        return dic[defaultName]
    }
    
    open func set(_ value: Any?, forKey defaultName: String)
    {
        var dic: [String:Any?]!
        
        if FileManager.default.fileExists(atPath: fullPath)
        {
            let data = try! Data(contentsOf: fullURL)
            let propertyList = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
            dic = propertyList as! [String:Any]
            dic.updateValue(value, forKey: defaultName)
        }else
        {
            dic = [defaultName:value]
        }
        
        //save
        let newData = try! PropertyListSerialization.data(fromPropertyList: dic, format: .xml, options: 0)
        try! newData.write(to: fullURL)
    }
    
    open func removeObject(forKey defaultName: String)
    {
        if FileManager.default.fileExists(atPath: fullPath)
        {
            let data = try! Data(contentsOf: fullURL)
            let propertyList = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil)
            var dic = propertyList as! [String:Any]
            dic.removeValue(forKey: defaultName)
            //save
            let newData = try! PropertyListSerialization.data(fromPropertyList: dic, format: .xml, options: 0)
            try! newData.write(to: fullURL)
        }
        
    }
    
    
    
}
//    func object(forKey defaultName: String) -> Any?
//    {
//        let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//        let fullPath = rootPath + "/MyUserDefaults.plist"
//
//        if !FileManager.default.fileExists(atPath: fullPath)
//        {
//            if let bundlePath = Bundle.main.path(forResource: "MyUserDefaults", ofType: "plist")
//            {
//                try? FileManager.default.copyItem(atPath: bundlePath, toPath: fullPath)
//            }
//        }
//
//        if let data = try? Data(contentsOf: URL(fileURLWithPath: fullPath)),
//            var dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as! [String:Any]
//        {
//            let newData = dic[defaultName]
//            print("MyUserDefaults Object")
//            print(newData)
//            print("=======================")
//            print("MyUserDefaults Object full")
//            print(dic)
//            print("=======================")
//            return newData
//        }
//
//        return nil
//    }
//
//    open func set(_ value: Any?, forKey defaultName: String)
//    {
//        let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//        let fullPath = rootPath + "/MyUserDefaults.plist"
//
//        if !FileManager.default.fileExists(atPath: fullPath) {
//            if let bundlePath = Bundle.main.path(forResource: "MyUserDefaults", ofType: "plist")
//            {
//                try? FileManager.default.copyItem(atPath: bundlePath, toPath: fullPath)
//            }
//        }
//
//        if let data = try? Data(contentsOf: URL(fileURLWithPath: fullPath)),
//            var dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as! [String:Any]
//        {
//            print("MyUserDefaults set before")
//            print(dic)
//            print("=======================")
//            dic[defaultName] = value
//            print("MyUserDefaults set after")
//            print(dic)
//            let newData = try? PropertyListSerialization.data(fromPropertyList: dic, format: .xml, options: 0)
//            try? newData?.write(to: URL(fileURLWithPath: fullPath))
//        }
//    }
//
//    open func removeObject(forKey defaultName: String)
//    {
//        let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
//        let fullPath = rootPath + "/MyUserDefaults.plist"
//
//        if !FileManager.default.fileExists(atPath: fullPath) {
//            if let bundlePath = Bundle.main.path(forResource: "MyUserDefaults", ofType: "plist")
//            {
//                try? FileManager.default.copyItem(atPath: bundlePath, toPath: fullPath)
//            }
//        }
//
//        if let data = try? Data(contentsOf: URL(fileURLWithPath: fullPath)),
//            var dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as! [String:Any]
//        {
//            print("MyUserDefaults remove before")
//            print(dic)
//            print("=======================")
//            dic.removeValue(forKey: defaultName)
//            print("MyUserDefaults remove after")
//            print(dic)
//            let newData = try? PropertyListSerialization.data(fromPropertyList: dic, format: .xml, options: 0)
//            try? newData?.write(to: URL(fileURLWithPath: fullPath))
//        }
//    }
//}
//

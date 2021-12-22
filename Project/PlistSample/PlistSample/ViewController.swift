//
//  ViewController.swift
//  PlistSample
//
//  Created by Hansub Yoo on 2018. 2. 27..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loadDataDic = loadPlistData(fileName: "Sample")
        print(loadDataDic["name"])
        
        
        
//        MyUserDefaults().object(forKey: "Name")
//        print("===========================")
//        MyUserDefaults().set(["Han":"kangsu"], forKey: "NameA")
//        MyUserDefaults().set(["Sub":"st"], forKey: "NameB")
//        MyUserDefaults().set("Kang", forKey: "NameC")
//        MyUserDefaults().set("Hong", forKey: "NameD")
//        print("===========================")
//        MyUserDefaults().removeObject(forKey: "NameD")
//        print("===========================")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPlistData(fileName: String) -> [String:String] {
        
        //1. path
        if let path = Bundle.main.path(forResource: fileName, ofType: "plist")//plist의 이름과 타입을 넣으면 경로를 String으로 반환
        {
            //2. load to data
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path))//경로에 있는 데이터를 읽어 옴
                //밑에 다시 확인
                if let dic = try PropertyListSerialization.propertyList(from: data,/*  */ options: .mutableContainersAndLeaves, format: nil) as? [String:String]
                {
                    return dic
                }
            } catch
            {
                print("에러")
            }
        }
        
        return [:]
    }
    
    func loadPlistForDoc(fileName: String) -> [String:String]? {
        let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let fullPath = rootPath + "/" + fileName + ".plist"
        
        if !FileManager.default.fileExists(atPath: fullPath)
        {
            //파일이 없을때의 행동
            //번들에 있는 데이터를 도큐먼트에 복사
            if let bundlePath = Bundle.main.path(forResource: fileName, ofType: "plist")
            {
                try? FileManager.default.copyItem(atPath: bundlePath, toPath: fullPath)
            }
        }
        
        if let data = try? Data(contentsOf: URL(fileURLWithPath: fullPath)),
            var dic = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as! [String:String]
        {
            //데이터 변경
            dic.updateValue("wing", forKey: "ID")
            
            let newData = try? PropertyListSerialization.data(fromPropertyList: dic, format: .xml, options: 0)
            try? newData?.write(to: URL(fileURLWithPath: fullPath))
        }
        
        //try가 옵셔널이 너무 신경쓰이면 전체를 do-try-catch로 감싼다.
        return nil
    }
    
}


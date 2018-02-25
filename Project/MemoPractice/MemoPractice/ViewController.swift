//
//  ViewController.swift
//  MemoPractice
//
//  Created by Hansub Yoo on 2018. 2. 24..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

let key: String = "memoKey"

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var strArr: [String] = [String]()
    
    @objc func notiAction(_ noti: Notification) {
        print("noti")
        
        let msg = noti.object as! String
        strArr = UserDefaults.standard.array(forKey: key) as? [String] ?? []
        
        if strArr.count == 0
        {
            print("count 0")
            strArr = []
        }
        
        strArr.append(msg)
        print(msg)
        UserDefaults.standard.set(strArr, forKey: key)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        strArr = UserDefaults.standard.object(forKey: key) as? [String] ?? []
        
        return strArr.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = UserDefaults.standard.array(forKey: key)?[indexPath.row] as? String
        
        print("hi")
        
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(notiAction(_:)), name: Notification.Name(rawValue: key), object: nil)
        
        if let b: [String] = UserDefaults.standard.array(forKey: key) as? [String]
        {
            for a in b
            {
                print(a)
            }
        }
    }
    

    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: key), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("aaaa")
    }
}


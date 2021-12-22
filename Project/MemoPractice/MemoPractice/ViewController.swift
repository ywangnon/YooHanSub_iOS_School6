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
    ///userDefault 저장 프로퍼티
    var strArr: [String] = [String]()
    ///테이블뷰
    @IBOutlet weak var myTableView: UITableView!

    /// notification Method
    ///
    /// - Parameter noti: 전달받는 notification
    @objc func notiAction(_ noti: Notification) {
        print("notiAction")
        
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
        
        myTableView.reloadData()
    }
    
    /// 테이블뷰의 하나의 섹션이 가지는 row값
    ///
    /// - Parameters:
    ///   - tableView: 해당 테이블 뷰
    ///   - section: 섹션이 가졌으면 하는 row값
    /// - Returns: 섹션이 가지는 row값
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        strArr = UserDefaults.standard.object(forKey: key) as? [String] ?? []
        
        return strArr.count
    }
    
    /// table View에서 재사용되는 cell
    ///
    /// - Parameters:
    ///   - tableView: 해당 테이블 뷰
    ///   - indexPath: 해당 index의 cell 정보
    /// - Returns: 재사용 되는 cell 정보
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = UserDefaults.standard.array(forKey: key)?[indexPath.row] as? String
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //시작하며 noti 등록, 이 뷰가 새롭게 불릴 시 noti가 중복 등록 될 수 있기 때문에 viewDidLoad말고 다른 곳에서 등록하는 것이 좋다.
        NotificationCenter.default.addObserver(self, selector: #selector(notiAction(_:)), name: Notification.Name(rawValue: key), object: nil)
        print("noti 등록")
    }
    
    deinit {
        // 해당 notification 해제
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: key), object: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("did Select Row")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


//
//  ViewController.swift
//  Notification
//
//  Created by Hansub Yoo on 2018. 2. 23..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "notiKey"), object: nil, queue: nil) { (noti) in
            let msg = noti.object as! String
            self.lb.text = msg
            print("noti Action")
        }
        
        let ad: NextViewController = NextViewController()
        
        
        
//        NotificationCenter.default.addObserver(self, selector: #selector(notiAction(_:)), name: Notification.Name(rawValue: "notiKey"), object: nil)
    }

    @objc func notiAction(_ noti: Notification)
    {
        let msg = noti.object as! String
        lb.text = msg
        print("noti Action")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: "notiKey"), object: nil)
    }


}


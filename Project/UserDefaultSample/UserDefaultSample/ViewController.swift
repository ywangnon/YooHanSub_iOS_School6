//
//  ViewController.swift
//  UserDefaultSample
//
//  Created by Hansub Yoo on 2018. 2. 9..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

let key = "UserNameList"

class ViewController: UIViewController {
    @IBOutlet weak var tf: UITextField?
    @IBOutlet weak var tf2: UITextField?
//    @IBOutlet weak var tf3: UITextField?
//    @IBOutlet weak var tf4: UITextField?
    
    @IBAction func addAction(_ sender: Any) {
        
        guard let t1 = tf?.text, let t2 = tf2?.text else {
            print("오류")
            return
        }
        
        UserDefaults.standard.set(t2, forKey: t1)
        
//        if var list = UserDefaults.standard.array(forKey: key) as? [String]
//        {
//            list.append(tf!.text!)
//            UserDefaults.standard.set(list, forKey: key)
//        }else
//        {
//            let newNameList = [tf!.text!]
//            UserDefaults.standard.set(newNameList, forKey: key)
//        }
    }
    
    @IBAction func printAction(_ sender: Any) {
        
        
//        if var list = UserDefaults.standard.array(forKey: key) as? [String]
//        {
//            for name in list{
////                print(name)
//                if tf.text == name
//                {
//                    print("찾았다.")
//                }else
//                {
//                    print("없다.")
//                }
//            }
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


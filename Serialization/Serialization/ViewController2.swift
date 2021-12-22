//
//  ViewController2.swift
//  Serialization
//
//  Created by Hansub Yoo on 2018. 3. 15..
//  Copyright © 2018년 Giftbot. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    
    private var dirPath: String {
        return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    }
    private let customClass1 = CustomClass1(name: "giftbot", job: "iOS Developer")
    private let customClass2 = CustomClass2(name: "giftbot", job: "iOS Developer")
    private let customClass3 = CustomClass3(name: "giftbot", job: "iOS Developer")
    private let customClass4 = CustomClass4(name: "giftbot", job: "iOS Developer")
    
    private func basicSerialization() {
        let str = "iOS School"
        _ = try? str.write(toFile: dirPath + "/string", atomically: true, encoding: .utf8)
        let loadString = try? String(contentsOfFile: dirPath + "/string", encoding: .utf8)
        print(loadString ?? "Failed")
        
        let arr = Array(1...9)
        _ = (arr as NSArray).write(toFile: dirPath, atomically: true)
        let loadArray = NSArray(contentsOfFile: dirPath + "/arr") as? [Int]
        print(loadArray ?? "Failed")
        
        let url = URL(fileURLWithPath: dirPath + "/color")
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

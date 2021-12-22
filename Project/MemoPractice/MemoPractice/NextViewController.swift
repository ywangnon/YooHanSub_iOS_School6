//
//  NextViewController.swift
//  MemoPractice
//
//  Created by Hansub Yoo on 2018. 2. 25..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet var NextViewTextView: UITextView?
    
    /// 버튼 눌렀을시 행동
    ///
    /// - Parameter sender: UI버튼
    @IBAction  func NextViewBtnAction(_ sender: UIButton) {
        print("nextBtn")
        //notification에 정보를 담아 보내줌
        NotificationCenter.default.post(name: Notification.Name(rawValue: key), object: NextViewTextView?.text)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NextViewTextView?.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

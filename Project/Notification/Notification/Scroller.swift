//
//  Scroller.swift
//  Notification
//
//  Created by Hansub Yoo on 2018. 2. 23..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class Scroller: UIViewController {

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var tf: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: nil) { (noti) in
            if let keyboardFrame = noti.userInfo![UIKeyboardFrameEndUserInfoKey] as? CGRect
            {
                self.scroll.contentOffset = CGPoint(x: 0, y: keyboardFrame.size.height)
            }
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: nil) { (noti) in
            self.scroll.contentOffset = CGPoint(x: 0, y: 0)
        }
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

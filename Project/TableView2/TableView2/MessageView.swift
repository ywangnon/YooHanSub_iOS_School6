//
//  MessageView.swift
//  TableView2
//
//  Created by Hansub Yoo on 2018. 2. 22..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class MessageView: UIViewController {
    
    var msg: String?
    @IBOutlet weak var msgLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "세부사항", style: .plain, target: nil, action: nil)
        msgLB.text = msg
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    

}

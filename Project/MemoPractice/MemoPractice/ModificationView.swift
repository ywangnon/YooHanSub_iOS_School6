//
//  ModificationView.swift
//  MemoPractice
//
//  Created by Hansub Yoo on 2018. 2. 26..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ModificationView: UIViewController {

    @IBAction func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func deletionAction(_ sender: UIButton) {
        
    }
    
    @IBAction func modifyAction(_ sender: UIButton) {
        
    }
    
    @IBOutlet var myTextView: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

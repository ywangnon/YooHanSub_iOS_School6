//
//  SignupController.swift
//  BlackJack
//
//  Created by Hansub Yoo on 2018. 2. 18..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class SignupController: UIViewController, SignupViewDelegate {
    
    func cancelAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let sign: SignupView = SignupView(frame: view.bounds)
        sign.backgroundColor = UIColor.green
        sign.delegate = self
        view.addSubview(sign)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

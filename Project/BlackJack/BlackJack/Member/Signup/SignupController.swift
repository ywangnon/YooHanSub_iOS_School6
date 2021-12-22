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
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "회원 가입"
        
        let signBG: UIImageView = UIImageView(frame: view.bounds)
        signBG.backgroundColor = .white
        signBG.image = UIImage(named: "BlackjackSignup")
        view.addSubview(signBG)
        
        let sign: SignupView = SignupView(frame: view.bounds)
        sign.delegate = self
        view.addSubview(sign)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


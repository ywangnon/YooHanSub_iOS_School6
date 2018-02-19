//
//  MemberController.swift
//  BlackJack
//
//  Created by Hansub Yoo on 2018. 2. 17..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

let key = "UserID"

class MemberController: UIViewController, MemberViewDelegate {
    
    func signAction(_ sender: UIButton) {
        let signup: SignupController = SignupController()
        self.present(signup, animated: true, completion: nil)
    }
    
    func confirmAction(_ sender: UIButton) {
        let blackjack: BlackjackController = BlackjackController()
        self.present(blackjack, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginView: MemberView = MemberView(frame: view.bounds)
        loginView.backgroundColor = UIColor.yellow
        loginView.delegate = self
        view.addSubview(loginView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

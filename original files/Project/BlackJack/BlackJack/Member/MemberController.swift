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
        print("눌렀다")
        let signup: SignupController = SignupController()
        self.navigationController?.pushViewController(signup, animated: true)
    }
    
    func confirmAction(_ sender: UIButton) {
        let blackjack: BlackjackController = BlackjackController()
        self.present(blackjack, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        self.navigationItem.title = "회원 로그인"
        super.viewDidLoad()
        
        let loginBG: UIImageView = UIImageView(frame: view.bounds)
        loginBG.image = UIImage(named: "BlackjackLogin")
        view.addSubview(loginBG)
        
        let loginView: MemberView = MemberView(frame: view.bounds)
        loginView.delegate = self
        view.addSubview(loginView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

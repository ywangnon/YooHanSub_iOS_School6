//
//  ViewController.swift
//  BlackJack
//
//  Created by Hansub Yoo on 2018. 2. 17..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startImg: UIImageView = UIImageView(frame: view.bounds)
        startImg.image = UIImage(named: "BlackjackStart")
        view.addSubview(startImg)
        
        let startBtn: UIButton = UIButton(frame: view.bounds)
        startBtn.addTarget(self, action: #selector(memberAction(_:)), for: .touchUpInside)
        view.addSubview(startBtn)
    }
    
    @objc func memberAction(_ sender: UIButton) {
        let member: MemberController = MemberController()
        let navigationController = UINavigationController(rootViewController: member)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


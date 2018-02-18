//
//  ViewController.swift
//  BlackJack
//
//  Created by Hansub Yoo on 2018. 2. 17..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let member: MemberController = MemberController(nibName: "MemberController", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startImg: UIImageView = UIImageView(frame: view.bounds)
        startImg.image = UIImage(named: "Blackjack")
        view.addSubview(startImg)
        
        let startBtn: UIButton = UIButton(frame: view.bounds)
        startBtn.addTarget(self, action: #selector(memberAction(_:)), for: .touchUpInside)
        view.addSubview(startBtn)
        
        print(view.bounds.width)
        print(view.bounds.height)
    }
    
    @objc func memberAction(_ sender: UIButton) {
        self.present(member, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


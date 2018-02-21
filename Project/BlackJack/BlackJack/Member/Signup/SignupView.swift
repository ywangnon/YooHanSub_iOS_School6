//
//  SignupView.swift
//  BlackJack
//
//  Created by Hansub Yoo on 2018. 2. 18..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class SignupView: UIView {
    
    var delegate: SignupViewDelegate?
    var idTF: UITextField?
    var passTF: UITextField?
    var passConfirmTF: UITextField?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSignup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSignup() {
        
        //뷰 전체 길이
        let viewWidth: CGFloat = self.bounds.width
        let viewheight: CGFloat = self.bounds.height
        
        //tilte setting
        let titleSize: CGRect = CGRect(x: 0, y: 0, width: viewWidth, height: viewheight*0.1)
        let titleLB: UILabel = UILabel(frame: titleSize)
        titleLB.text = "Blackjack"
        titleLB.textAlignment = .center
        titleLB.font = UIFont.systemFont(ofSize: 20)
        self.addSubview(titleLB)
        
        //입력란 사이즈
        let tlbSize: CGRect = CGRect(x: 0, y: 0, width: viewWidth*0.5, height: viewheight*0.05)
        
        //id 입력란
        idTF = UITextField(frame: tlbSize)
        idTF?.frame.origin.x = viewWidth*0.25
        idTF?.frame.origin.y = viewheight*0.2
        idTF?.backgroundColor = .white
        idTF?.layer.borderColor = UIColor.black.cgColor
        idTF?.placeholder = "  id"
        idTF?.layer.borderWidth = 1
        idTF?.layer.cornerRadius = 10
        self.addSubview(idTF!)
        
        passTF = UITextField(frame: tlbSize)
        passTF?.frame.origin.x = viewWidth*0.25
        passTF?.frame.origin.y = viewheight*0.3
        passTF?.backgroundColor = .white
        passTF?.layer.borderColor = UIColor.black.cgColor
        passTF?.placeholder = "  password"
        passTF?.isSecureTextEntry = true
        passTF?.layer.borderWidth = 1
        passTF?.layer.cornerRadius = 10
        self.addSubview(passTF!)
        
        passConfirmTF = UITextField(frame: tlbSize)
        passConfirmTF?.frame.origin.x = viewWidth*0.25
        passConfirmTF?.frame.origin.y = viewheight*0.4
        passConfirmTF?.backgroundColor = .white
        passConfirmTF?.layer.borderColor = UIColor.black.cgColor
        passConfirmTF?.placeholder = "  passwordConfirm"
        passConfirmTF?.isSecureTextEntry = true
        passConfirmTF?.layer.borderWidth = 1
        passConfirmTF?.layer.cornerRadius = 10
        self.addSubview(passConfirmTF!)
        
        //button
        let btnSize: CGRect = CGRect(x: 0, y: 0, width: viewWidth*0.3, height: viewheight*0.05)
        let signup: UIButton = UIButton(frame: btnSize)
        signup.frame.origin.x = viewWidth*0.1
        signup.frame.origin.y = viewheight*0.5
        signup.layer.cornerRadius = 5
        signup.setTitle("회원 등록", for: .normal)
        signup.addTarget(self, action: #selector(signupAC(_:)), for: .touchUpInside)
        signup.backgroundColor = .green
        self.addSubview(signup)
        
        let calcelSize: CGRect = CGRect(x: 0, y: 0, width: viewWidth*0.3, height: viewheight*0.05)
        let calcel: UIButton = UIButton(frame: calcelSize)
        calcel.frame.origin.x = viewWidth*0.6
        calcel.frame.origin.y = viewheight*0.5
        calcel.layer.cornerRadius = 5
        calcel.setTitle("취소", for: .normal)
        calcel.addTarget(self, action: #selector(cancelAC(_:)), for: .touchUpInside)
        calcel.backgroundColor = .green
        self.addSubview(calcel)
    }
    
    @objc func cancelAC(_ sender: UIButton) {
        delegate?.cancelAction(sender)
    }
    
    @objc func signupAC(_ sender: UIButton) {
        
        guard let id = idTF?.text, let pass = passTF?.text, let confirm = passConfirmTF?.text else {
            print("텍스트창에 입력하세요")
            return
        }
        
        if let users: [String:Any] = UserDefaults.standard.dictionary(forKey: key)
        {
            for userid in users
            {
                if userid.key == id
                {
                    print("이미 있는 id")
                    return
                }
            }
        }
        
        if pass == confirm {
            if var UserIDs: [String : Any] = UserDefaults.standard.dictionary(forKey: key)
            {
                UserIDs.updateValue(pass, forKey: id)
                UserDefaults.standard.set(UserIDs, forKey: key)
            } else{
                var UserIDs: [String : String] = [:]
                UserIDs.updateValue(pass, forKey: id)
                UserDefaults.standard.set(UserIDs, forKey: key)
            }
            self.cancelAC(sender)
        }else
        {
            print("비밀번호가 다릅니다.")
        }
    }
}

protocol SignupViewDelegate {
    func cancelAction(_ sender: UIButton)
}

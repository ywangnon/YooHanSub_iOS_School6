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
        let idTF: UITextField = UITextField(frame: tlbSize)
        idTF.frame.origin.x = viewWidth*0.25
        idTF.frame.origin.y = viewheight*0.2
        idTF.layer.borderColor = UIColor.black.cgColor
        idTF.placeholder = "  id"
        idTF.layer.borderWidth = 1
        idTF.layer.cornerRadius = 10
        self.addSubview(idTF)
        
        let passTF: UITextField = UITextField(frame: tlbSize)
        passTF.frame.origin.x = viewWidth*0.25
        passTF.frame.origin.y = viewheight*0.3
        passTF.layer.borderColor = UIColor.black.cgColor
        passTF.placeholder = "  password"
        passTF.isSecureTextEntry = true
        passTF.layer.borderWidth = 1
        passTF.layer.cornerRadius = 10
        self.addSubview(passTF)
        
        let passConfirmTF: UITextField = UITextField(frame: tlbSize)
        passConfirmTF.frame.origin.x = viewWidth*0.25
        passConfirmTF.frame.origin.y = viewheight*0.4
        passConfirmTF.layer.borderColor = UIColor.black.cgColor
        passConfirmTF.placeholder = "  passwordConfirm"
        passConfirmTF.isSecureTextEntry = true
        passConfirmTF.layer.borderWidth = 1
        passConfirmTF.layer.cornerRadius = 10
        self.addSubview(passConfirmTF)
        
        //button
        let btnSize: CGRect = CGRect(x: 0, y: 0, width: viewWidth*0.3, height: viewheight*0.05)
        let signup: UIButton = UIButton(frame: btnSize)
        signup.frame.origin.x = viewWidth*0.1
        signup.frame.origin.y = viewheight*0.5
        signup.layer.cornerRadius = 5
        signup.setTitle("회원 등록", for: .normal)
        signup.backgroundColor = .green
        self.addSubview(signup)
        
        let calcelSize: CGRect = CGRect(x: 0, y: 0, width: viewWidth*0.3, height: viewheight*0.05)
        let calcel: UIButton = UIButton(frame: calcelSize)
        calcel.frame.origin.x = viewWidth*0.6
        calcel.frame.origin.y = viewheight*0.5
        calcel.layer.cornerRadius = 5
        calcel.setTitle("취소", for: .normal)
        calcel.backgroundColor = .green
        self.addSubview(calcel)
    }
    
    func cancelAC(_ sender: UIButton) {
        
    }
    
    func signupAC(_ sender: UIButton) {
        
    }
}

protocol SignupViewDelegate {
    func signupAction(_ sender: UIButton)
    func cancelAction(_ sender: UIButton)
}

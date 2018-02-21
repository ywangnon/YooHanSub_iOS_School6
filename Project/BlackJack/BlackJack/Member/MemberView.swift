//
//  MemberView.swift
//  BlackJack
//
//  Created by Hansub Yoo on 2018. 2. 17..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

/// 로그인 뷰
class MemberView: UIView {
    
    var delegate: MemberViewDelegate?
    var idTF: UITextField?
    var passTF: UITextField?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createLoginView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLoginView() {
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
        
        //button
        let btnSize: CGRect = CGRect(x: 0, y: 0, width: viewWidth*0.3, height: viewheight*0.05)
        let signup: UIButton = UIButton(frame: btnSize)
        signup.frame.origin.x = viewWidth*0.1
        signup.frame.origin.y = viewheight*0.45
        signup.layer.cornerRadius = 5
        signup.setTitle("회원 등록", for: .normal)
        signup.addTarget(self, action: #selector(signAC(_:)), for: .touchUpInside)
        signup.backgroundColor = .green
        self.addSubview(signup)
        
        let confirmSize: CGRect = CGRect(x: 0, y: 0, width: viewWidth*0.3, height: viewheight*0.05)
        let confirm: UIButton = UIButton(frame: confirmSize)
        confirm.frame.origin.x = viewWidth*0.6
        confirm.frame.origin.y = viewheight*0.45
        confirm.layer.cornerRadius = 5
        confirm.setTitle("확인", for: .normal)
        confirm.addTarget(self, action: #selector(confirmAC(_:)), for: .touchUpInside)
        confirm.backgroundColor = .green
        self.addSubview(confirm)
    }
    
    @objc func signAC(_ sender: UIButton) {
        delegate?.signAction(sender)
    }
    
    @objc func confirmAC(_ sender: UIButton) {
        
        guard let id = idTF?.text, let pass = passTF?.text else{
            return
        }
        
        if let users = UserDefaults.standard.dictionary(forKey: key)
        {
            for user in users
            {
                if user.key == id
                {
                    if String(describing: user.value) == pass
                    {
                        delegate?.confirmAction(sender)
                        return
                    }
                }
            }
        }
        print("id나 비밀번호가 틀렸습니다.")
    }
}

protocol MemberViewDelegate {
    func signAction(_ sender: UIButton)
    func confirmAction(_ sender: UIButton)
}

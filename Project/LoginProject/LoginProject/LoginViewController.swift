//
//  LoginViewController.swift
//  LoginProject
//
//  Created by Hansub Yoo on 2018. 2. 20..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //1. tf 2개 필요(아이디//패스워드)
    var idTf: UITextField!
    var pwTf: UITextField!
    
    //2. 버튼 2개 필요(로그인 버튼/ 회원가입 버튼)
    var loginBtn: UIButton!
    var signupBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    //createUI
    //1. UI만들기
    private func createUI()
    {
        let toolBarKeyboard = UIToolbar()
        toolBarKeyboard.sizeToFit()
        let BtnDoneBar = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneBtnCliicked(_:)))
        toolBarKeyboard.items = [BtnDoneBar]
        toolBarKeyboard.tintColor = #colorLiteral(red: 0.2980392157, green: 0.6862745098, blue: 0.3137254902, alpha: 1)
        
        idTf = UITextField()
        idTf.placeholder = "아이디를 입력해주세요"
        idTf.tag = 10
        idTf.borderStyle = .line
        idTf.textAlignment = .center
        idTf.delegate = self
        idTf.inputAccessoryView = toolBarKeyboard
        view.addSubview(idTf)
        
        pwTf = UITextField()
        pwTf.placeholder = "패스워드를 입력해주세요"
        pwTf.tag = 11
        pwTf.borderStyle = .line
        pwTf.textAlignment = .center
        pwTf.isSecureTextEntry = true
        pwTf.keyboardType = .numbersAndPunctuation
        
        pwTf.delegate = self
        view.addSubview(pwTf)
        
        loginBtn = UIButton(type: .custom)
        loginBtn.setTitle("로그인", for: .normal)
        loginBtn.setTitleColor(.black, for: .normal)
        loginBtn.setTitleColor(.gray, for: .highlighted)
        loginBtn.addTarget(self, action: #selector(touchUpInsideLoginBtn(_:)), for: .touchUpInside)
        view.addSubview(loginBtn)
        
        signupBtn = UIButton(type: .custom)
        signupBtn.setTitle("회원가입", for: .normal)
        signupBtn.setTitleColor(.black, for: .normal)
        signupBtn.setTitleColor(.gray, for: .highlighted)
        signupBtn.addTarget(self, action: #selector(touchUpInsideSignupBtn(_:)), for: .touchUpInside)
        view.addSubview(signupBtn)
        
        updateLayout()
        
        self.navigationItem.title = "로그인"
        
    }
    
    //2.UI frame잡기
    private func updateLayout()
    {
        var offSetY: CGFloat = 150
        var inputFrameWidth: CGFloat = view.frame.size.width / 2
        var offsetX: CGFloat = view.frame.size.width/2 - inputFrameWidth/2
        idTf.frame = CGRect(x: view.frame.size.width/2 - inputFrameWidth/2, y: offSetY, width: inputFrameWidth, height: 50)
        offSetY += idTf.frame.size.height + 10
        pwTf.frame = CGRect(x: view.frame.size.width/2 - inputFrameWidth/2, y: offSetY, width: inputFrameWidth, height: 50)
        offSetY += pwTf.frame.size.height + 30
        
        let btnMargin: CGFloat = 10
        loginBtn.frame = CGRect(x: offsetX, y: offSetY, width: (inputFrameWidth - 10)/2, height: 50)
        offsetX += loginBtn.frame.size.width + btnMargin
        signupBtn.frame = CGRect(x: offsetX, y: offSetY, width: (inputFrameWidth - 10)/2, height: 50)
    }
    
    @objc private func touchUpInsideLoginBtn(_ sender: UIButton)
    {
        if checkInputValid()
        {
            print("로그인")
        }
    }
    
    @objc private func touchUpInsideSignupBtn(_ sender: UIButton)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signupVC: SignupController = storyboard.instantiateViewController(withIdentifier: "SignupController") as! SignupController
        
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    
    private func checkInputValid() -> Bool
    {
        //pw체크
        if pwTf.text!.count > 4 {
            return true
        }else
        {
            let alertVC: UIAlertController = UIAlertController(title: "문제발생", message: "비밀번호가 너무 짧습니다.", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            alertVC.addAction(action)
            self.present(alertVC, animated: true, completion: nil)
            
            return false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if idTf.tag == 10
        {
            idTf.resignFirstResponder()
            pwTf.becomeFirstResponder()
        }else
        {
            pwTf.resignFirstResponder()
        }
        return true
        
//        if idTf.isFirstResponder
//        {
//            idTf.resignFirstResponder()
//            pwTf.becomeFirstResponder()
//        }else
//        {
//            pwTf.resignFirstResponder()
//        }
//
//        return true
    }
    
    @objc func doneBtnCliicked(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
//    func isLogin(<#parameters#>) -> <#return type#> {
//        if UserDataCenter.main.isLogin!
//        {
//            
//        }
//    }
}

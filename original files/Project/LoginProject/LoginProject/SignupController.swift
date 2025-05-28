//
//  SignupController.swift
//  LoginProject
//
//  Created by Hansub Yoo on 2018. 2. 20..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

let key = "userID"

class SignupController: UIViewController, UITextFieldDelegate {
    
    var idTf: UITextField!
    var pwTf: UITextField!
    var confirmTf: UITextField!
    var signupBtn: UIButton!
    var cancelBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTf = UITextField()
        idTf.placeholder = "아이디를 입력해주세요"
        idTf.tag = 10
        idTf.borderStyle = .line
        idTf.textAlignment = .center
        idTf.delegate = self
        view.addSubview(idTf!)
        
        pwTf = UITextField()
        pwTf.placeholder = "패쓰워드를 입력해주세요"
        pwTf.tag = 11
        pwTf.borderStyle = .line
        pwTf.textAlignment = .center
        pwTf.isSecureTextEntry = true
        idTf.delegate = self
        view.addSubview(pwTf!)
        
        confirmTf = UITextField()
        confirmTf.placeholder = "다시 한번 패쓰워드를 입력해주세요"
        confirmTf.tag = 12
        confirmTf.borderStyle = .line
        confirmTf.textAlignment = .center
        confirmTf.isSecureTextEntry = true
        confirmTf.delegate = self
        view.addSubview(confirmTf!)
        
        signupBtn = UIButton(type: .custom)
        signupBtn.setTitle("가입", for: .normal)
        signupBtn.setTitleColor(.black, for: .normal)
        signupBtn.setTitleColor(.gray, for: .highlighted)
        signupBtn?.addTarget(self, action: #selector(signupAction(_:)), for: .touchUpInside)
        view.addSubview(signupBtn!)
        
        cancelBtn = UIButton(type: .custom)
        cancelBtn.setTitle("취소", for: .normal)
        cancelBtn.setTitleColor(.black, for: .normal)
        cancelBtn.setTitleColor(.gray, for: .highlighted)
        cancelBtn?.addTarget(self, action: #selector(cancelAction(_:)), for: .touchUpInside)
        view.addSubview(cancelBtn!)
        
        createUI()
        
        self.navigationItem.title = "회원 가입"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func createUI()
    {
        var offSetY: CGFloat = 150
        var inputFrameWidth: CGFloat = view.frame.size.width / 2
        var offsetX: CGFloat = view.frame.size.width/2 - inputFrameWidth/2
        idTf.frame = CGRect(x: view.frame.size.width/2 - inputFrameWidth/2, y: offSetY, width: inputFrameWidth, height: 50)
        offSetY += idTf.frame.size.height + 10
        pwTf.frame = CGRect(x: view.frame.size.width/2 - inputFrameWidth/2, y: offSetY, width: inputFrameWidth, height: 50)
        offSetY += pwTf.frame.size.height + 10
        confirmTf.frame = CGRect(x: view.frame.size.width/2 - inputFrameWidth/2, y: offSetY, width: inputFrameWidth, height: 50)
        offSetY += confirmTf.frame.size.height + 30
        
        let btnMargin: CGFloat = 10
        signupBtn.frame = CGRect(x: offsetX, y: offSetY, width: (inputFrameWidth - 10)/2, height: 50)
        offsetX += signupBtn.frame.size.width + btnMargin
        cancelBtn.frame = CGRect(x: offsetX, y: offSetY, width: (inputFrameWidth - 10)/2, height: 50)
    }
    
    @objc func signupAction(_ sender: UIButton) {
        
        guard let id = idTf?.text, let pw = pwTf?.text, let cf = confirmTf?.text else
        {
            let alret: UIAlertController = UIAlertController(title: "경고", message: "전부 기입하지 않았습니다.", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            alret.addAction(action)
            self.present(alret, animated: true, completion: nil)
            
            return
        }
        
        if let users = UserDefaults.standard.dictionary(forKey: key)
        {
            for user in users
            {
                if user.key == id
                {
                    let alret: UIAlertController = UIAlertController(title: "경고", message: "같은 아이디가 있습니다.", preferredStyle: .alert)
                    let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
                    alret.addAction(action)
                    self.present(alret, animated: true, completion: nil)
                    
                    return
                }
            }
        }
        
        if pw == cf
        {
            let dic: [String:Any] = [id:pw]
            UserDefaults.standard.set(dic, forKey: key)
            
            let alret: UIAlertController = UIAlertController(title: "가입 완료", message: "가입이 완료되었습니다.", preferredStyle: .alert)
            let action = UIAlertAction(title: "오케이", style: .default) { (alertAC) in
//                self.dismiss(animated: true, completion: nil)
                self.navigationController?.popViewController(animated: true)
            }
            alret.addAction(action)
            self.present(alret, animated: true, completion: nil)
        }else
        {
            let alret: UIAlertController = UIAlertController(title: "경고", message: "비밀번호가 서로 다릅니다.", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .cancel, handler: nil)
            alret.addAction(action)
            self.present(alret, animated: true, completion: nil)
        }
    }
    
    @objc func cancelAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if idTf.isFirstResponder
        {
            idTf.resignFirstResponder()
            pwTf.becomeFirstResponder()
        }else if pwTf.isFirstResponder
        {
            pwTf.resignFirstResponder()
            confirmTf.becomeFirstResponder()
        }else
        {
            self.confirmTf.resignFirstResponder()
        }
        
        return true
    }
}

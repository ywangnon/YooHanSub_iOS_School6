//
//  SignupController.swift
//  ProjectSample
//
//  Created by Hansub Yoo on 2018. 3. 27..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit
import Alamofire

class SignupController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPWTextField: UITextField!
    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var EmailTextField: UITextField!
    
    @IBAction func cancelAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signupAction(_ sender: UIButton) {
        guard let username = idTextField.text,
            let password = passwordTextField.text else {
                print("빈칸오류")
                return
        }
        
        var params: Parameters = [
            "username": username,
            "password": password
        ]
        
        if let first = FirstNameTextField.text {
            params.updateValue(first, forKey: "first_name")
        }
        if let last = LastNameTextField.text {
            params.updateValue(last, forKey: "last_name")
        }
        if let email = EmailTextField.text {
            params.updateValue(email, forKey: "email")
        }
        
        
        Alamofire
            .request("https://api.lhy.kr"+"/members/signup/", method: .post, parameters: params)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let Value):
                    self.dismiss(animated: true, completion: nil)
//                    let json = try! JSONSerialization.data(withJSONObject: Value, options: [])
                    print(Value)
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

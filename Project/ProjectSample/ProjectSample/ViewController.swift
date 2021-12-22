//
//  ViewController.swift
//  ProjectSample
//
//  Created by Hansub Yoo on 2018. 3. 27..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var testLabel: UILabel!
    
    var token: String?
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        guard let username = idTextField.text,
            let password = passwordTextField.text else {
                print("빈칸오류")
                return
        }
        
        let params: Parameters = [
            "username": username,
            "password": password
        ]
        
        Alamofire.request("https://api.lhy.kr"+"/members/auth-token/", method: .post, parameters: params)
            .validate() // 자료 온거 체크
            .responseData { (response) in
                switch response.result {
                case .success(let value):
                    do {
                        let userInfo = try JSONDecoder().decode(user.self, from: value)
                        print(userInfo.token)
                        print(userInfo.user)
                        print("Success")
                        self.token = userInfo.token
                        self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    print(value)
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }
    }
    
    @IBAction func signupAction(_ sender: UIButton) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSegue" {
            let nextViewController = segue.destination as! AddPost
            nextViewController.token = self.token
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.num
        
        //        Alamofire.requst("https://google.com")
        //        .validate() // 자료 온거 체크
        //            .responseData { (response) in
        //                switch response.result {
        //                case .success(let value):
        //                    print(value)
        //                case .failure(let error):
        //                    print(error.localizedDescription)
        //                }
        //        }

        //        let params: Parameters = [
        //            "username": "giftbot",
        //            "password": "giftbot"
        //        ]
        //        let token = "myToken"
        //        let header = ["Authorization": "Token \(token)"]
        //        Alamofire
        //            .request("https://google.com", method: .post, parameters: params, headers: header)
        //        .validate()
        //            .responseData { () in
        //
        //        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


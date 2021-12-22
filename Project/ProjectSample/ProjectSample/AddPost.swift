//
//  AddPost.swift
//  ProjectSample
//
//  Created by Hansub Yoo on 2018. 3. 27..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit
import Alamofire

class AddPost: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    @IBOutlet weak var imageTextField: UITextField!
    var token: String?
    
    @IBAction func addAction(_ sender: UIButton) {
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
        
        print("\n---------- [ \(token) ] ----------\n")
        
        guard let title = titleTextField.text else {
            print("빈칸오류")
            return
        }
        
        var params: Parameters = [
            "title": title
        ]
        
        if let content = contentTextField.text {
            params.updateValue(content, forKey: "content")
        }
        if let img = imageTextField.text {
            params.updateValue(img, forKey: "imgcover")
        }
        
        guard let headToken = token else {return}
        let header = ["Authorization": "Token \(headToken)"]
        
        let urlRequest = try? URLRequest(url: URL(string:"https://api.lhy.kr/posts/")!, method: .post, headers: header)
        
        
        
        Alamofire.request("https://api.lhy.kr/posts/", method: .post, parameters: params, headers: header)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let Value):
                    print(Value)
                    let bookInfo = try! JSONDecoder().decode(postlist.self, from: Value)
                    print(bookInfo.title)
                    print(bookInfo.content)
                    print("\n---------- [ success ] ----------\n")
                case .failure(let error):
                    print(error)
                    print("\n---------- [ fail ] ----------\n")
                }
        }
        
        Alamofire.upload(multipartFormData: { (multiPartFormData) in

        }, with: urlRequest!) { (encodingResult) in
            switch encodingResult {
                
            case .success(let request, let streamingFromDisk, let streamFileURL):
                request.responseData(completionHandler: { (response) in
                    switch response.result {
                    case .success(_):
                        print("\n---------- [ image success ] ----------\n")
                    case .failure(_):
                        print("\n---------- [ image fail ] ----------\n")
                    }
                })
            case .failure(let error):
                print("\n---------- [ image fail 2R ] ----------\n")
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

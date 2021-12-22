//
//  PostList.swift
//  ProjectSample
//
//  Created by Hansub Yoo on 2018. 3. 27..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit
import Alamofire

class PostList: UIViewController {

    @IBOutlet weak var pageTextField: UITextField!
    var token: String?
    
    @IBAction func nextPageAction (_ sender: UIButton) {
        
    }
    
    @IBAction func beforeAction(_ sender: UIButton) {
        
    }
    
    @IBAction func goToPageAction(_ sender: UIButton) {
        guard let page = pageTextField.text else {
                print("빈칸오류")
                return
        }
        
        var params: Parameters = [
            "page": page
        ]
        
        Alamofire
            .request("https://api.lhy.kr"+"/posts/", method: .get, parameters: params)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success(let value):
                    print("\n---------- [ success ] ----------\n")
                    do {
                        let bookInfo = try! JSONDecoder().decode([postlist].self, from: value)
                        print(bookInfo)
                        print("Completely Success")
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                    print(value)
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

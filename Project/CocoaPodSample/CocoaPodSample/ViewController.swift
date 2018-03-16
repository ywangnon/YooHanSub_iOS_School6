//
//  ViewController.swift
//  CocoaPodSample
//
//  Created by Hansub Yoo on 2018. 3. 16..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    lazy var imageView = UIImageView(frame: view.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        
        let str = "https://www.google.co.kr/url?sa=i&rct=j&q=&esrc=s&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwixnMDfpfDZAhWJVbwKHTjbCu4QjRx6BAgAEAU&url=https%3A%2F%2Fnamu.wiki%2Fw%2F%25EA%25B3%25A0%25EC%2596%2591%25EC%259D%25B4&psig=AOvVaw0BS_BmG-wHVu1gwRdrTB6W&ust=1521270868147952"
        let url = URL(string: str)!
        Alamofire.request(url)
            .responseData { (dataResponse) in
                if dataResponse.error != nil {
                    print(dataResponse.error!)
                }
                if dataResponse.result.isSuccess {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: dataResponse.data!)!
                    }
                }else {
                    print()
                }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


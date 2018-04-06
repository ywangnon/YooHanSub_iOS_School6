//
//  ViewController.swift
//  AnimationTest
//
//  Created by Hansub Yoo on 2018. 4. 3..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imgs: [UIImage] = [#imageLiteral(resourceName: "img1.jpg"),#imageLiteral(resourceName: "img2.jpg"),#imageLiteral(resourceName: "img3.jpg")]
        
        imgView.animationImages = imgs
        imgView.animationDuration = 0.5
        imgView.animationRepeatCount = 4
        imgView.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


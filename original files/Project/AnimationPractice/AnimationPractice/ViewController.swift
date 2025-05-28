//
//  ViewController.swift
//  AnimationPractice
//
//  Created by Hansub Yoo on 2018. 3. 20..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var leftBtnlocation: CGRect!
    var rightBtnlocation: CGRect!
    
    
    
    @IBOutlet weak var view1: UIView!
    let leftBtn0: UIButton = UIButton()
    let leftView1: UIView = UIView()
    let leftView2: UIView = UIView()
    
    let rightView1: UIView = UIView()
    let rightView2: UIView = UIView()
    
    @IBAction func leftBtn0(_ sender: Any) {
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1, animations: {
                self.leftView1.frame.origin.y = 466
            })
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.2, animations: {
                self.leftView2.frame.origin.y = 366
            })
        })
    }
    
    @IBOutlet weak var testImgView: UIImageView!
    
    @IBAction func rightBtn0(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        leftBtnlocation = CGRect(x: 116, y: 566, width: 68, height: 68)
//        leftView1.frame = leftBtnlocation
//        leftView1.backgroundColor = UIColor.black
//        leftView2.frame = leftBtnlocation
//        leftView2.backgroundColor = UIColor.black
//        view.addSubview(leftView1)
//        view.addSubview(leftView2)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


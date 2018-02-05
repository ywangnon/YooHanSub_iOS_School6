//
//  newController.swift
//  StateTest
//
//  Created by Hansub Yoo on 2018. 2. 5..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class newController: UIViewController, UITextFieldDelegate {
    
    var tf: UITextField!
    var tf2: UITextField!
    var resultLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createBG()
        
        tf = UITextField(frame: CGRect(x: 40, y: 130, width: 200, height: 30))
        tf.borderStyle = .line
        tf.placeholder = "hihihi"
        tf.delegate = self
        tf.tag = 1
        view.addSubview(tf)
        
        resultLB = UILabel(frame: CGRect(x: 40, y: 180, width: 200, height: 30))
        resultLB.textColor = UIColor.red
        resultLB.textAlignment = .right
        resultLB.layer.borderWidth = 1
        view.addSubview(resultLB)
        
        tf2 = UITextField(frame: CGRect(x: 40, y: 230, width: 200, height: 30))
        tf2.borderStyle = .line
        tf2.placeholder = "hihihi"
        tf2.delegate = self
        tf2.tag = 2
        view.addSubview(tf2)
        
        let btn = UIButton()
        btn.frame = CGRect(x: 70, y: 300, width: 80, height: 50)
        btn.addTarget(self, action: #selector(self.btnHandeler), for: .touchUpInside)
        btn.setTitle("눌러봐", for: .normal)
        btn.setTitleColor(UIColor.blue, for: .normal)
        view.addSubview(btn)
    }
    
    @objc func btnHandeler(_ sender: UIButton) {
        resultLB.text = tf.text
        tf.text = ""
    }
    
    
    func createBG() {
        print("초기화")
        
        let imgView: UIImageView = UIImageView(frame: view.bounds)
        imgView.image = UIImage(named: "android.png")
        imgView.contentMode = UIViewContentMode.scaleAspectFit
        view.addSubview(imgView)
        
        let myLB: UILabel = UILabel(frame: CGRect(x: 10, y: 10, width: view.frame.size.width-20, height: 150))
        myLB.text = "안드로이드 이슈"
        myLB.textColor = UIColor.red
        myLB.font = UIFont.systemFont(ofSize: 30)
        myLB.textAlignment = .center
        view.addSubview(myLB)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 1
        {
            tf2.becomeFirstResponder()
        }else
        {
            tf2.resignFirstResponder()
        }
        return true
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

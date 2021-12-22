//
//  ViewController.swift
//  NavigationTest
//
//  Created by Hansub Yoo on 2018. 2. 9..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func NextButton(_ sender: Any) {
        let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController")
        
        self.navigationController?.pushViewController(nextVC!, animated: true)
    }
    
    @IBAction func NextXIBButton(_ sender: Any) {
        
        let nextVC = NextViewController(nibName: "NextViewController", bundle: nil)
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func initNextView(_ sender: Any) {
        let nextVC = UIViewController()
        nextVC.view.backgroundColor = .white
        
        let labelSize: CGRect = nextVC.view.bounds
        let nextVCLB: UILabel = UILabel(frame: labelSize)
        nextVCLB.text = "InitNextView"
        nextVCLB.font = UIFont.systemFont(ofSize: 50)
        nextVCLB.textAlignment = .center
        nextVC.view.addSubview(nextVCLB)
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //left
        let leftItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(leftAction(_:)))
        self.navigationItem.leftBarButtonItem = leftItem
        
        //title
        
        self.title = "메인페이지"
        //right
        let rightItem = UIBarButtonItem(title: "오른쪽", style: .done, target: self, action: #selector(rightAction(_:)))
        self.navigationItem.rightBarButtonItem = rightItem
        
        
//        let icon = UIImageView(image: UIImage(named: "android.png"))
//        icon.frame = CGRect(x: 0, y: 0, width: 40, height: 100)
//        icon.contentMode = .scaleAspectFit
//        icon.clipsToBounds = true
//        icon.widthAnchor.constraint(equalToConstant: 32.0).isActive = true
//        icon.heightAnchor.constraint(equalToConstant: 32.0).isActive = true
//        let item: UIBarButtonItem = UIBarButtonItem(customView: icon)
//
//        self.navigationItem.rightBarButtonItem = item
//        self.navigationItem.title = "안녕"
    }
    
    @objc func leftAction(_ sender: UIBarButtonItem) {
        
    }
    
    @objc func rightAction(_ sender: UIBarButtonItem) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


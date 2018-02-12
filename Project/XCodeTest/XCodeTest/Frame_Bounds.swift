//
//  ViewController.swift
//  XCodeTest
//
//  Created by Hansub Yoo on 2018. 1. 10..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lb:UILabel!
    var customView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("최초의 프린트!!")
        
        print("두번째 프린트!@")
        
        print("세번째 프린트!")
        
        print("네번째 프린트!")
        
        lb.backgroundColor = .red
        
        let viewWidth: CGFloat = CGFloat(view.bounds.size.width)/CGFloat(3)
        
        let viewSize: CGRect = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height)
        customView = UIView(frame: viewSize)
//        customView?.bounds = CGRect(x: viewWidth, y: viewWidth, width: view.bounds.size.width, height: view.bounds.size.height)
        customView?.bounds.origin.x = viewWidth
        customView?.bounds.origin.y = viewWidth
        customView?.backgroundColor = UIColor.yellow
        view.addSubview(customView!)
        
        makeView(num: 9, widthNum: 3)
    }
    
    func makeView(num: Int, widthNum: Int) {
        
        let viewWidth: CGFloat = CGFloat(view.bounds.size.width)/CGFloat(widthNum)
        
        for number in 0..<num
        {
            let col: CGFloat = CGFloat(number%widthNum)
            let row: CGFloat = CGFloat(number/widthNum)
            
            let cgRect: CGRect = CGRect(x: col*viewWidth, y: row*viewWidth, width: viewWidth, height: viewWidth)
            let cgview: UIView = UIView(frame: cgRect)
            customView?.addSubview(cgview)
            
            let lbSize: CGRect = cgview.bounds
            let lbView: UILabel = UILabel(frame: lbSize)
            lbView.text = String(number)
            lbView.textAlignment = .center
            lbView.layer.borderColor = UIColor.blue.cgColor
            lbView.layer.borderWidth = 1
            lbView.font = UIFont.systemFont(ofSize: 30)
            cgview.addSubview(lbView)
        }
    }
}

//
//  ViewController.swift
//  UITest
//
//  Created by Hansub Yoo on 2018. 1. 29..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //뷰 리스트 만들기
        let vList = makeViewList(num: 10)
        //프레임 변경
        //        updateSize(list: vList, margin: 15)
        
        updateFrameForCollection(for: vList, colum: 4)
        //서브뷰 추가
        seeViewList(list: vList)
        
        //        let cgRect: CGRect = CGRect(x: (view.frame.size.width/2.0)-50.0, y: (view.frame.size.height/2.0)-50.0, width: 100, height: 100)
        //        let subView: UIView = UIView(frame: cgRect)
        //        subView.backgroundColor = UIColor.brown
        //        view.addSubview(subView)
        //        let cgRect: CGRect = CGRect(x: 15, y: 15, width: view.bounds.size.width-30, height: view.bounds.size.height-30)
        //        let subView: UIView = UIView(frame: cgRect)
        //        subView.backgroundColor = UIColor.blue
        //        view.addSubview(subView)
        //
        //        let cgRect2: CGRect = CGRect(x: 15, y: 15, width: subView.bounds.size.width-30, height: subView.bounds.size.height-30)
        //        let subView2: UIView = UIView(frame: cgRect2)
        //        subView2.backgroundColor = UIColor.red
        //        subView.addSubview(subView2)
        //
        //        let cgRect3: CGRect = CGRect(x: 15, y: 15, width: subView2.bounds.size.width-30, height: subView2.bounds.size.height-30)
        //        let subView3: UIView = UIView(frame: cgRect3)
        //        subView3.backgroundColor = UIColor.green
        //        subView2.addSubview(subView3)
        
        
        
        //        let cgRect1: CGRect = CGRect(x: 15, y: 15, width: 345, height: 100)
        //        let cgRect2: CGRect = CGRect(x: 15, y: view.frame.size.height-115, width: 345, height: 100)
        //        let subView1: UIView = UIView(frame: cgRect1)
        //        let subView2: UIView = UIView(frame: cgRect2)
        //        subView1.backgroundColor = UIColor.blue
        //        subView2.backgroundColor = UIColor.blue
        //        self.view.addSubview(subView1)
        //        self.view.addSubview(subView2)
        
        
        
        
        //        let subView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height/2))
        //        subView.backgroundColor = UIColor.red
        //        self.view.addSubview(subView)// view: rootView
        
        
        //        let subView: UIView = UIView(frame: CGRect(x: 100, y: 100, width: 150, height: 100))
        //        subView.backgroundColor = UIColor(red: 100/255, green: 100/255, blue: 100/255, alpha: 1)
        //        self.view.addSubview(subView)// view: rootView
        
        //        let color: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        //        subView.backgroundColor
        //
        //        let rect: CGRect = CGRect(x: 100, y: 100, width: 150, height: 100)
        //
        //        let v: UIView = UIView(frame: rect)
    }
    
    //    func makeViewList(num: Int) -> [UIView]
    //    {
    //        var vList:[UIView] = []
    //        for number in 0..<num
    //        {
    //
    //        }
    //    }
    
    func updateFrameForCollection(for list:[UIView], colum: Int) {
        
        for index in 0..<list.count
        {
            let col = index % colum
            let row = index / colum
            
            let width:CGFloat = self.view.frame.size.width/CGFloat(colum)
            
            list[index].frame = CGRect(x: 0 + CGFloat(col) * width, y: 0 + CGFloat(row) * width, width: width, height: width)
        }
    }
    
    func makeViewList(num: Int) -> [UIView] {
        var viewList:[UIView] = []
        for number in 0..<num {
            let v = UIView()
            v.backgroundColor = getColor(num: number)
            viewList.append(v)
        }
        
        return viewList
    }
    
    func updateSize(list: [UIView], margin: CGFloat) {
        for num in 0..<list.count {
            if num == 0 {
                list[num].frame = CGRect(x: margin, y: margin, width: view.frame.size.width-margin*2, height: view.bounds.size.height - margin * 2)
                
            } else {
                let superFrame = list[num-1].bounds.size
                list[num].frame = CGRect(x: margin, y: margin, width: superFrame.width-margin*2, height: superFrame.height - margin * 2)
            }
        }
    }
    
    func seeViewList(list: [UIView]) {
        for num in 0..<list.count {
            view.addSubview(list[num])
            //            if num == 0
            //            {
            //                view.addSubview(list[0])
            //            } else {
            //                list[num-1].addSubview(list[num])
            //            }
        }
    }
    
    func getColor(num: Int) -> UIColor {
        let color = num % 7
        
        switch color
        {
        case 0:
            return UIColor.red
        case 1:
            return UIColor.orange
        case 2:
            return UIColor.yellow
        case 3:
            return UIColor.green
        case 4:
            return UIColor.blue
        case 5:
            return UIColor.cyan
        case 6:
            return UIColor.purple
        default:
            return UIColor.white
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


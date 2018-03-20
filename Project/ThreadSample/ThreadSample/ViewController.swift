//
//  ViewController.swift
//  ThreadSample
//
//  Created by Hansub Yoo on 2018. 3. 20..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    @IBOutlet weak var uiView: UIView?
    
    /********************************************
     사용 목적이 다름
     serialQueue 일을 하나하나 받음
     concurrentQueue 일을 한꺼번에 받음
     ********************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        bigTaskOnMainThread()
    }
    
    private func bigTaskOnMainThread() {
        print("big task start")
        DispatchQueue.global().async { // 이게 있으면 바로 바뀌고, 없으면 나중에 바뀐다.
            for _ in 0...900_000_000 { _ = 1 + 1 }
            print("big task end. start UI task")
        }
        view.backgroundColor = .magenta
    }
    
    private func uiTaskOnBackgroundThread() {
        DispatchQueue.global().async {
            [weak self] in
            for _ in 0...900_000_000 { _ = 1 + 1 }
            
            DispatchQueue.main.async {//메인큐에 어씽크로 넘겨라
//                self?.uiView?.frame.origin.y += 250
                self?.view?.backgroundColor = .yellow
            }
        }
    }
    
    
    
    private func concurrentQueue() {
        
    }
    
    private func initiallyInactiveQueue() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


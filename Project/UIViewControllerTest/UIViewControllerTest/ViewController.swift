//
//  ViewController.swift
//  UIViewControllerTest
//
//  Created by Hansub Yoo on 2018. 2. 8..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func initAction(_ sender: Any) {
        
        let alertVC = UIAlertController(title: "타이틀", message: "여기가 메세지", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "오케이", style: .default) { (action) in
            //해당 버튼이 클릭되면 해야될 행동
            
        }
        
        alertVC.addAction(action1)
        
        self.present(alertVC, animated: true, completion: nil)
        
//        let nextVC = NextViewController()
//        nextVC.view.backgroundColor = .white
//        self.present(nextVC, animated: true, completion: nil)
//
//
//
//        self.present(alertVC, animated: true, completion: nil)
    }
    
    
    @IBAction func action2(_ sender: Any) {
        
        let alertVC = UIAlertController(title: "타이틀", message: "여기가 메세지", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "오케이", style: .default) { (action) in
            
        }
        
        let action2 = UIAlertAction(title: "타이틀", style: .cancel) { (action) in
            
        }
        
        alertVC.addAction(action1)
        alertVC.addAction(action2)

        self.present(alertVC, animated: true, completion: nil)
        
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//
//        let nextVC2: NextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
//
//        nextVC2.modalTransitionStyle = UIModalTransitionStyle.partialCurl
//
//        self.present(nextVC2, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func action(_ sender: Any) {
//        let nextVC = NextViewController(nibName: "NextViewController", bundle: nil)
//        self.present(nextVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("didLoad")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("Memorywarning")
    }
    
    override func loadView() {
        super.loadView()
        print("loadView!")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("viewAppear!!")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("didSubviews")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("willSubview")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        print("didAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        print("willDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        print("didDIsapper")
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "mainToNext" {
            return false
        }else
        {
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextVC = segue.destination as? NextViewController
        {
            nextVC.title = self.title
        }
        
        if let secondVC = segue.destination as? ViewController
        {
            
        }
    }
}


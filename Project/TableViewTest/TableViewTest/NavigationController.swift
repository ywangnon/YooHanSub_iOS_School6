//
//  NavigationController.swift
//  TableViewTest
//
//  Created by Hansub Yoo on 2018. 2. 21..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class NavigationController: UIViewController {
    
    var text: String?
    var lb: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lb = UILabel(frame: view.bounds)
        lb?.text = text
        lb?.textAlignment = .center
        view.addSubview(lb!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

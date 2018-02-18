//
//  MemberController.swift
//  BlackJack
//
//  Created by Hansub Yoo on 2018. 2. 17..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class MemberController: UIViewController, MemberViewDelegate {
    
    let signup: SignupController = SignupController()
    
    
    func signAction(_ sender: UIButton) {
        self.present(signup, animated: true, completion: nil)
    }
    
    func confirmAction(_ sender: UIButton) {
//        self.present(<#T##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
    }
    
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        viewDidLoad()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginView: MemberView = MemberView(frame: view.bounds)
        loginView.backgroundColor = UIColor.yellow
        loginView.delegate = self
        view.addSubview(loginView)
        
        print("===================")
        print(view.bounds.width)
        print(view.bounds.height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

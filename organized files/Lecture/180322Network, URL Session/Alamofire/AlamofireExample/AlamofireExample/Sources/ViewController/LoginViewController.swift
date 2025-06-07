//
//  LoginViewController.swift
//  AlamofireExample
//
//  Created by giftbot on 2018. 3. 27..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
  
  var authService: AuthServiceType?
  @IBOutlet private weak var usernameTextField: UITextField!
  @IBOutlet private weak var passwordTextField: UITextField!
  
  static func createWith(authService: AuthServiceType = AuthService()) -> Self {
    let storyboard = UIStoryboard(name: "Login", bundle: nil)
    let `self` = storyboard.instantiateViewController(ofType: self.self)
    self.authService = authService
    return self
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    usernameTextField.text = "giftbot"
    passwordTextField.text = "giftbot"
  }
  
  @IBAction private func signInButtonDidTap(_ sender: UIButton) {
    guard let username = usernameTextField.text,
      let password = passwordTextField.text
      else { return }
    
    authService?.signIn(username: username, password: password) { result in
      switch result {
      case .success(let user):
        print("Login user :", user)
        AppDelegate.instance.setupRootViewController()
      case .error(let error):
        print(error.localizedDescription)
      }
    }
  }
  
  deinit {
    print("\(self) has deinitialized")
  }
}

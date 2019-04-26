//
//  UserManager.swift
//  AlamofireExample
//
//  Created by giftbot on 2018. 3. 27..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import Foundation

struct UserManager {
  private init() {}
  
  private static var _token: String?
  static var token: String? {
    get { return _token == nil ? nil : "Token \(_token!)" }
    set { _token = newValue }
  }
}

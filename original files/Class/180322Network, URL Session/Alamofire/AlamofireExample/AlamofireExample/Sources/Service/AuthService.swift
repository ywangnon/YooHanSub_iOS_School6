//
//  AuthService.swift
//  AlamofireExample
//
//  Created by giftbot on 2018. 3. 27..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import Alamofire

protocol AuthServiceType {
  func signIn(username: String, password: String, completion: @escaping (Result<User>) -> ())
}

struct AuthService: AuthServiceType {
  func signIn(username: String, password: String, completion: @escaping (Result<User>) -> ()) {
    guard !username.isEmpty else { return completion(.error(AuthError.invalidUsername)) }
    guard !password.isEmpty else { return completion(.error(AuthError.invalidPassword)) }
    
    let params: Parameters = [
      "username": username,
      "password": password
    ]
    
    Alamofire.request(API.Auth.signIn, method: .post, parameters: params)
      .validate()
      .responseData { (response) in
        switch response.result {
        case .success(let value):
          do {
            let signInUser = try value.decode(User.self)
            completion(.success(signInUser))
          } catch {
            completion(.error(error))
          }
        case .failure(let error):
          completion(.error(error))
        }
      }
  }
}


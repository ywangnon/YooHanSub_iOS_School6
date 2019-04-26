//
//  MainViewController.swift
//  AlamofireExample
//
//  Created by giftbot on 2018. 3. 27..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
  
  var postService: PostServiceType?
  
  static func createWith(postService: PostServiceType = PostService()) -> Self {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let `self` = storyboard.instantiateViewController(ofType: self.self)
    self.postService = postService
    return self
  }
  
  @IBAction private func signOut(_ sender: UIButton) {
    UserManager.token = nil
    AppDelegate.instance.setupRootViewController()
  }
  
  @IBAction private func retrievePostList(_ sender: UIButton) {
    postService?.retrievePostList(completion: { (result) in
      switch result {
      case .success(let postList):
        print(postList)
      case .error(let error):
        print(error)
      }
    })
  }
  
  @IBAction private func createPost(_ sender: UIButton) {
    postService?.createPost(title: "MyTitle", content: "TextContent", imageData: nil, completion: { (result) in
      switch result {
      case .success(let post):
        print(post)
      case .error(let error):
        print(error.localizedDescription)
      }
    })
  }
  
  @IBAction private func createPostWithImage(_ sender: UIButton) {
    guard let data = UIImagePNGRepresentation(#imageLiteral(resourceName: "image1")) else { return print(PostError.encodingError) }
    
    postService?.createPost(title: "MyTitle", content: "ContentWithImage", imageData: data, completion: { (result) in
      switch result {
      case .success(let post):
        print(post)
      case .error(let error):
        print(error)
      }
    })
  }
  
  deinit {
    print("\(self) has deinitialized")
  }
}

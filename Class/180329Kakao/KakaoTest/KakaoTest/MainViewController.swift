//
//  MainViewController.swift
//  KakaoTest
//
//  Created by Hansub Yoo on 2018. 3. 29..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var nickNameLabel: UILabel!
    
    @IBAction private func logoutButtonDidTap(_ sender: Any) {
        KOSession.shared().logoutAndClose { (success, error) -> Void in
            if error != nil {
                print(error?.localizedDescription)
                
                // Failed to logout
                return
            }
            // Logout success
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        KOSessionTask.meTask { [weak self] (result, error) in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            print("\n---------- [ user ] ----------\n")
            let user = result as! KOUser
            print(user)
            
            guard let properties = user.properties else { return }
            print("\n---------- [ properties ] ----------\n")
            
            guard let nickName = properties[KOUserNicknamePropertyKey] as? String else { return }
            self?.nickNameLabel.text = nickName
            print("\n---------- [ nickName ] ----------\n")
            print(nickName)
            
            guard let profileImageLink = properties[KOUserProfileImagePropertyKey] as? String,
                let thumbnailImageLink = properties[KOUserThumbnailImagePropertyKey] as? String
                else {return}
            
            
            let imageLinks = [profileImageLink, thumbnailImageLink]
            for link in imageLinks {
                let url = URL(string: link)!
                let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                    if error != nil {
                        print(error!.localizedDescription)
                        return
                    }
                    guard let data = data, let image = UIImage(data: data) else { return }
                    
                    DispatchQueue.main.async {
                        if link == profileImageLink {
                            self?.profileImageView.image = image
                        } else {
                            self?.thumbnailImageView.image = image
                        }
                    }
                })
                task.resume()
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

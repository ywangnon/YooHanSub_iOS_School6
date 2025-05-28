//
//  DetailViewController.swift
//  IdolTable
//
//  Created by Hansub Yoo on 2018. 2. 28..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var bgImgView: UIImageView!
    @IBOutlet weak var profiileImgView: UIImageView!
    @IBOutlet weak var nickNameLb: UILabel!
    @IBOutlet weak var descriptionLb: UILabel!
    @IBOutlet weak var phoneNumLb: UILabel!
    @IBOutlet weak var emailLb: UILabel!
    
    
    
    
    
    var userData: UserModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let userData = userData
        {
            bgImgView.image = UIImage(named: userData.bgImgUrl)
            profiileImgView.image = UIImage(named: userData.profileImgUrl)
            nickNameLb.text = userData.nickName
            descriptionLb.text = userData.profileDescription
            phoneNumLb.text = userData.phoneNumber
            emailLb.text = userData.email
        }
        

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profiileImgView.layer.cornerRadius = profiileImgView.frame.size.width/2
        profiileImgView.clipsToBounds = true
        profiileImgView.layer.borderColor = UIColor.black.cgColor
        profiileImgView.layer.borderWidth = 1
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

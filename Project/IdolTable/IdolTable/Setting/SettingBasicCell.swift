//
//  SettingBasicCell.swift
//  IdolTable
//
//  Created by Hansub Yoo on 2018. 3. 1..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class SettingBasicCell: UITableViewCell {
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var InfoLb: UILabel!
    
    var title: String = ""
    var versionInfo: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLb.text = title
        InfoLb.text = versionInfo
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

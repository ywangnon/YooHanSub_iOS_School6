//
//  SettingCell.swift
//  IdolTable
//
//  Created by Hansub Yoo on 2018. 2. 28..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class SettingDetailCell: UITableViewCell {

    @IBOutlet weak var titleLb: UILabel!
    
    var title: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLb.text = title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

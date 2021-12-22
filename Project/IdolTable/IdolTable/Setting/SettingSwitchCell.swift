//
//  SettingSwitchCell.swift
//  IdolTable
//
//  Created by Hansub Yoo on 2018. 3. 1..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class SettingSwitchCell: UITableViewCell {
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var cellSW: UISwitch!
    
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

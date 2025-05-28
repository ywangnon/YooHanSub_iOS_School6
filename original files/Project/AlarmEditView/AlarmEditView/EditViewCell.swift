//
//  EditViewCell.swift
//  AlarmEditView
//
//  Created by Hansub Yoo on 2018. 3. 23..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class EditViewCell: UITableViewCell {

    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellAccessary: UILabel!
    @IBOutlet weak var cellSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

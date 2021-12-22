//
//  TableViewCell.swift
//  TableView2
//
//  Created by Hansub Yoo on 2018. 2. 22..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nextLB: UILabel!
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var sub: UILabel!
    
    /// viewdidload와 같은 역할, 스토리보드로 초기화된 것
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

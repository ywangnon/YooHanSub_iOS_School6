//
//  SongCell.swift
//  DataModelTest
//
//  Created by Hansub Yoo on 2018. 2. 27..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet var songTitle: UILabel?
    @IBOutlet var songArtist: UILabel?
    @IBOutlet var writer: UILabel?
    
    var songData: Song? {
        didSet {
            if let data = songData
            {
                self.songTitle?.text = data.songTitle
                self.songArtist?.text = data.artist
                self.writer?.text = data.writer
            }
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}

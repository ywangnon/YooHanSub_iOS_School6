//
//  BlackjackView.swift
//  BlackJack
//
//  Created by Hansub Yoo on 2018. 2. 19..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class BlackjackView: UIView {


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createBlackView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createBlackView() {
        let dealerPartSize: CGRect = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height*0.5)
        let dealerPart: UIView = UIView(frame: dealerPartSize)
        dealerPart.backgroundColor = UIColor.yellow
        self.addSubview(dealerPart)
        
        let playerPartSize: CGRect = CGRect(x: 0, y: self.bounds.height*0.5, width: self.bounds.width, height: self.bounds.height*0.5)
        let playerPart: UIView = UIView(frame: playerPartSize)
        playerPart.backgroundColor = UIColor.green
        self.addSubview(playerPart)
        
        
        
    }
}

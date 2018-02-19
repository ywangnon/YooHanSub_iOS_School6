//
//  BlackjackController.swift
//  BlackJack
//
//  Created by Hansub Yoo on 2018. 2. 19..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit
import GameplayKit

class BlackjackController: UIViewController {
    
    let card: [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shuffled = GKMersenneTwisterRandomSource.sharedRandom().arrayByShufflingObjects(in: card)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

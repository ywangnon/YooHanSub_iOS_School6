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
    
    let cardNumList:[String] = ["ace","2","3","4","5","6","7","8","9","10","jack","queen","king"]
    let cardLogoList:[String] = ["clubs","hearts","diamonds","spades"]
    var cardList:[UIImageView] = []
    var comView: [UIImageView] = []
    var userView: [UIImageView] = []
    var shuffledCard: [Any] = []
    var count: Int = 0
    var comSum: Int = 0
    var userSum: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeCardList()

        print("=====pull=======")
        for card in cardList
        {
            print(card.tag)
        }
        print("=====pull=======")
        shuffledCard = GKMersenneTwisterRandomSource.sharedRandom().arrayByShufflingObjects(in: cardList)
        
        comSum += (shuffledCard[count] as AnyObject).tag
        comView.append(drawCard())
        comSum += (shuffledCard[count] as AnyObject).tag
        comView.append(drawCard())
        
        userSum += (shuffledCard[count] as AnyObject).tag
        userView.append(drawCard())
        userSum += (shuffledCard[count] as AnyObject).tag
        userView.append(drawCard())
        
        if comSum < 17
        {
            comSum += cardList[count].tag
            comView.append(drawCard())
        }
        
        for a in comView
        {
            print(a.tag)
        }
        print("==================")
        for b in userView
        {
            print(b.tag)
        }
    }
    
    func makeCardList() {
        for logo in cardLogoList
        {
            var tagNum = 1
            for num in cardNumList
            {
                let cardView: UIImageView = UIImageView()
                if let card:UIImage = UIImage(named: num+"_of_"+logo)
                {
                    cardView.image = card
                    cardView.tag = tagNum
                    cardList.append(cardView)
                    tagNum += 1
                    print("img"+String(tagNum))
                }
                print("card"+String(tagNum))
            }
        }
    }
    
    func drawCard() -> UIImageView {
        let cardIMGView = shuffledCard[count]
        
        if comSum>21
        {
            print("유저 승리")
        }else if userSum>21
        {
            print("유저 패배")
        }
        
        count += 1
        
        return cardIMGView as! UIImageView
    }
    
    func stand() {
        let result = userSum - comSum
        
        if result > 0
        {
            print("유저 승리")
        }else if result < 0
        {
            print("유저 패배")
        }else if result == 0
        {
            print("비김")
        }
    }
    
    @IBAction func HitAction(_ sender: Any) {
        userSum += (shuffledCard[count] as AnyObject).tag
        userView.append(self.drawCard())
        for a in comView
        {
            print(a.tag)
        }
        print("==================")
        for b in userView
        {
            print(b.tag)
        }
    }
    
    @IBAction func StandAction(_ sender: Any) {
        for a in comView
        {
            print(a.tag)
        }
        print("==================")
        for b in userView
        {
            print(b.tag)
        }
        self.stand()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

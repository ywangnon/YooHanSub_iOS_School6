//
//  ViewController.swift
//  SingViewTest
//
//  Created by Hansub Yoo on 2018. 1. 11..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var lb: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //시작지점
        // Do any additional setup after loading the view, typically from a nib.
        
        let hero: Person = Person()
        
        hero.name = "슈퍼맨"
        hero.age = 100
        hero.height = 200
        hero.weight = 100
        
        hero.plusStrength(click: 100)
        let heroWeight = hero.run(time: 10, distance: 10)
        let con = hero.concentaration(Streng: hero.strength)
        
        print(heroWeight)
        print(con)
        
        lb.text = hero.name
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


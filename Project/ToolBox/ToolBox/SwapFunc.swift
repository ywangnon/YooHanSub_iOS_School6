//
//  SwapFunc.swift
//  ToolBox
//
//  Created by Hansub Yoo on 2018. 1. 15..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

class SwapFunc {
    
    func inchTocm(inch: Double) -> Double {
        return inch * 2.54
    }
    
    func cmToinch(cm: Double) -> Double {
        return cm * 0.393701
        
    }
    
    func m2ToPyung(m2: Double) -> Double {
        return m2 * 0.3025
    }
    
    func pyungTom2(pyung: Double) -> Double {
        return pyung * 3.30579
    }
    
    func cTof(c: Double) -> Double {
        return c * 1.8 + 32
    }
    
    func fToc(f: Double) -> Double {
        return (f - 32.0) / 1.8
    }
    
    func kbTomb(kb: Double) -> Double {
        return kb / 1024
    }
    
    func mbTogb(mb: Double) -> Double {
        return mb / 1024
    }
    
    func timeTosecond(time: Int) -> Int {
        return (time/10000)*3600 + ((time%10000)/100)*60 + time%100
    }
    
    func secondToHour(second: Int) -> Int {
        return second%60 + ((second/60)%60)*100 + ((second/60)/60)*10000
    }
}

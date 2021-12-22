//
//  File&Private.swift
//  접근제어Test
//
//  Created by Hansub Yoo on 2018. 1. 26..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import Foundation

class A {
    fileprivate func add(num: Int) -> Int {
        return num
    }
}

class B {
    private var b: Int = 2
}


struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.width / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.width / 2)
        }
    }
}


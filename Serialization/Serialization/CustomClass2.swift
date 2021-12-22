//
//  CustomClass2.swift
//  Serialization
//
//  Created by giftbot on 2018. 1. 21..
//  Copyright © 2018년 Giftbot. All rights reserved.
//

// 컴퓨터가 코드를 읽는데 있어서 일반적인 데이터 타입은 [][][][][][]와 같은 규칙적인 크기의 메모리를 읽어서 해석한다.
// 하지만 커스텀 클래스는 Int, String, Array 등 다양한 타입이 있는 상황에서 어느정도의 데이터를 읽어야 할지 알지 못한다.
// 그것을 eCode와 deCode 로 컴퓨터가 어떻게 읽어야하는지 알려주며 바꿔주는 것이다. NSCoding

import Foundation

final class CustomClass2: NSObject, NSCoding {
  let name: String
  let job: String
  
  init(name: String, job: String) {
    self.name = name
    self.job = job
  }
  
  init(coder aDecoder: NSCoder) {
    name = aDecoder.decodeObject(forKey: "name") as! String
    job = aDecoder.decodeObject(forKey: "job") as! String
  }
    // 클래스를 만드는 것
    // CustomClass를 만들어야 하기 때문에 initializer
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: "name")
    aCoder.encode(job, forKey: "job")
  }
    // 데이터를 만드는 것
    // 데이터형이 다른 것으로 만들어야하기 때문에 function
    
  override var description: String {
    return name + " : " + job
  }
}

class CustomClass5: NSCoding {
    
    let cal: Int
    
    init(cal: Int) {
        self.cal = cal
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(cal, forKey: "cal")
    }
    
    required init?(coder aDecoder: NSCoder) {
        cal = aDecoder.decodeObject(forKey: "cal") as! Int
    }
}


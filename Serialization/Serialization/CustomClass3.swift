//
//  CustomClass3.swift
//  Serialization
//
//  Created by giftbot on 2018. 1. 21..
//  Copyright © 2018년 Giftbot. All rights reserved.
//

import Foundation

final class CustomClass3: NSObject, NSSecureCoding {
  /***************************************************
   [ NSCoder ]
   if let object = decoder.decodeObject(forKey: "myKey") as MyClass {
   // ...succeeds...
   } else {
   // ...fail...
   }
   decodeObject 하는 순간 이미 메모리에 생성된 상태
   메모리에 올라온 myKey를 MyClass가 아닌 해커가 원하는 다른 형태로 변환할 수 있기 때문에 필요한 부분만 바꾸는 secureCoding이 생김
     
   [ NSSecureCoding ]
   let obj = decoder.decodeObject(of:MyClass.self, forKey: "myKey")
   객체 변환 공격을 방어하기 위해 이와 같은 형태로 타입 확인과 디코딩을 동시에 하는 것이 안전
   ***************************************************/
  
  static var supportsSecureCoding: Bool {
    return true
  }
  
  let name: String
  let job: String
  
  init(name: String, job: String) {
    self.name = name
    self.job = job
  }
  
  init(coder aDecoder: NSCoder) {
    name = aDecoder.decodeObject(of: NSString.self, forKey: "name")! as String
    job = aDecoder.decodeObject(of: NSString.self, forKey: "job")! as String
  }
  
  func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: "name")
    aCoder.encode(job, forKey: "job")
  }

  override var description: String {
    return name + " : " + job
  }
}

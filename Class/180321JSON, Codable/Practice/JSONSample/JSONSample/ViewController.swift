//
//  ViewController.swift
//  JSONSample
//
//  Created by Hansub Yoo on 2018. 3. 21..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

//import PlaygroundSupport
//PlaygroundPage.current.needsIndefiniteExecution = true
// 플레이그라운드가 종료되지 않고 실행상태를 유지한다.

let apiURL = URL(string: "http://api.open-notify.org/astros.json")!
// http: 애플이 금지시키려고 해서 설정해야함
// info.plist -> App Transport Security Settings -> Allow Arbitrary Loads 되도록 허락함

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // URLSession 싱글톤이 있다.
        let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            //            print(data,response,error)
            guard error == nil else {
                print(error?.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse, 200..<400 ~= response.statusCode else {
                print("StatusCode is not valid")
                return
            }
            
            guard let data = data, let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as! [String:Any] else {
                print("No Data")
                return
            }
            guard (jsonObject["message"] as? String) == "success",
                let people = jsonObject["people"] as? [[String:String]],
                let peopleCount = jsonObject["number"] as? Int
                else {
                    print("Parsing Error")
                    return
            }
            
            print("총 \(peopleCount)명의 우주비행사가 탑승 중입니다.")
            
            print(" = 우주비행사 명단 =")
            people
                .flatMap{ $0["name"] }
                .forEach({print($0)})
            
            print(data)
            print(response)
            print(error)
        }
        
        dataTask.resume()// 처음에 액티비티 상태가 아니기때문에 resume을 꼭 해야한다.
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


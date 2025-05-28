//: [Previous](@previous)

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
//: - - -
//: # Parsing JSON
//: - - -

let apiURL = URL(string: "http://api.open-notify.org/astros.json")!
let task = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
  guard error == nil else {
    print(error!.localizedDescription)
    return
  }
  guard let response = response as? HTTPURLResponse, 200..<400 ~= response.statusCode else {
    print("StatusCode is not valid")
    return
  }
  guard let data = data,
    let jsonObject = try? JSONSerialization.jsonObject(with: data) as! [String: Any],
    (jsonObject["message"] as! String) == "success"
    else {
      print("Failed to download jsonData")
      return
  }
  guard let peopleCount = jsonObject["number"] as? Int,
    let people = jsonObject["people"] as? [[String: String]]
    else {
      print("Failed to parse JSON")
      return
  }
  print("총 \(peopleCount)명의 우주비행사가 탑승 중입니다.")
  
  print("= 우주비행사 명단 =")
  people
    .flatMap { $0["name"] }
    .forEach({ print($0) })
}

task.resume()



//: [Next](@next)

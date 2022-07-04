//: # Nested Codable
import Foundation

let jsonString = """
{
  "message": "success",
  "number": 3,
  "people": [
    {
      "craft": "ISS",
      "name": "Anton Shkaplerov"
    },
    {
      "craft": "ISS",
      "name": "Scott Tingle"
    },
    {
      "craft": "ISS",
      "name": "Norishige Kanai"
    }
  ]
}
""".data(using: .utf8)!

struct Astronauts: Decodable {
    let message: String
    let number: Int
    let people: [People]
    
    private enum CodingKeys: String, CodingKey {
        case message
        case number
        case people
    }
    
    struct People: Decodable {
        let craft: String
        let name: String
        
        private enum CodingKeys: String, CodingKey {
            case craft
            case name
        }
    }
}



//struct Astronauts: Decodable {
//    let message: String
//    let number: Int
//    let people: [Person]
//
//    enum CodingKeys: String, CodingKey {
//        case message
//        case number
//        case people
//    }
//
//    struct Person: Decodable {
//        let name: String
//
//        enum CodingKeys: String, CodingKey {
//            case name
//        }
//    }
//}


//let jsonData = jsonString.data(using: .utf8)!

do {
    let astronauts = try JSONDecoder().decode(Astronauts.self, from: jsonString)
    print(astronauts.message)
    print(astronauts.number)
    for person in astronauts.people {
        print(person)
    }
} catch {
    print(error.localizedDescription)
}



//do {
//  let astronauts = try JSONDecoder().decode(Astronauts.self, from: jsonData)
//  print(astronauts.message)
//  print(astronauts.number)
//  for person in astronauts.people {
//    print(person)
//  }
//} catch {
//  print(error.localizedDescription)
//}


//


//: [Next](@next)

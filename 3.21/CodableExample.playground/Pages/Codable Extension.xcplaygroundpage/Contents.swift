//: [Previous](@previous)
//: # Codable Extension

import Foundation

extension Data {
  func decode<T>(_ type: T.Type, decoder: JSONDecoder = JSONDecoder()) throws -> T where T: Decodable {
    return try decoder.decode(type, from: self) // 메타데이터
  }
}
// 프로토콜을 익스텐션함
extension Encodable {
  func encode(with encoder: JSONEncoder = JSONEncoder()) throws -> Data {
    return try encoder.encode(self)
  }
}

extension Decodable {
  static func decode(with decoder: JSONDecoder = JSONDecoder(), from data: Data) throws -> Self {
    return try decoder.decode(Self.self, from: data)
  }
}

struct Language: Codable, CustomStringConvertible {
  var name: String
  var version: String
  
  var description: String {
    return "\(name) \(version)"
  }
}

// create a new language
let language = Language(name: "Swift", version: "4")

// encode with one line of code
let data = try? language.encode()

let lang1 = try? Language.decode(from: data!)
let lang2 = try? data!.decode(Language.self)



//: [Next](@next)

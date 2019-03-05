//: [Previous](@previous)
import Foundation
//: - - -
//: # Creating JSON Data
//: * class func data(withJSONObject:options:) throws -> Data
//: * class func writeJSONObject(_:to:options:error:) -> Int
//: * class func isValidJSONObject(_:) -> Bool
//: - - -
//데이터형태를 JSON 형태로 바꾼것이 위 두개
//: ## Write JSON Object to OutputStream
func writeJSONObjectToOutputStream() {
  let jsonObject = ["hello": "world", "foo": "bar", "iOS": "Swift"]
  guard JSONSerialization.isValidJSONObject(jsonObject) else { return }
  
  let jsonFilePath = "myJsonFile.json"
  let outputJSON = OutputStream(toFileAtPath: jsonFilePath, append: false)!
  outputJSON.open()
  _ = JSONSerialization.writeJSONObject(
    jsonObject,
    to: outputJSON,
    options: [.prettyPrinted, .sortedKeys],
    //    options: [],
    error: nil
  )
  outputJSON.close()
  
  do {
    let jsonString = try String(contentsOfFile: jsonFilePath)
    print(jsonString)
  } catch {
    print(error.localizedDescription)
  }
}

//print("\n---------- [ writeJSONObjectToOutputStream ] ----------\n")
//writeJSONObjectToOutputStream()


//: ## Data with JSON Object
private func dataWithJSONObject() {
  let jsonObject1: [String: Any] = [
    "someNumber" : 1,
    "someString" : "Hello",
    "someArray"  : [1, 2, 3, 4],
    "someDict"   : [
      "someBool" : true
    ]
  ]
  let jsonObject2 = [
    "hello": "world",
    "foo": "bar",
    "iOS": "Swift",
    "1": "2"
  ]
  
  guard JSONSerialization.isValidJSONObject(jsonObject1),
    JSONSerialization.isValidJSONObject(jsonObject2)
    else { return }
  
  do {
    let encoded = try JSONSerialization.data(withJSONObject: jsonObject2)
//    let encoded = try JSONSerialization.data(withJSONObject: jsonObject2, options: [])
    
    let decoded = try JSONSerialization.jsonObject(with: encoded)
    if let jsonDict = decoded as? [String: Any] {
      print(jsonDict)
    }
  } catch {
    print(error.localizedDescription)
  }
}

//print("\n---------- [ dataWithJSONObject ] ----------\n")
//dataWithJSONObject()



//: - - -
//: # Creating a JSON Object
//: * class func jsonObject(with:options:) throws -> Any
//: - - -
// with = data 형태, stream 형태
//: ## JSON Object with Data
private func jsonObjectWithData() {
//  let jsonString =  """
//  {
//    "someNumber" : 1,
//    "someString" : "Hello",
//    "someArray"  : [1, 2, 3, 4],
//    "someDict"   : {
//      "someBool" : true
//    }
//  }
//  """
    // 데이터 형태는 0101011100010101011110100000
  let jsonString = """
     { "hello": "world", "foo": "bar", "iOS": "Swift" }
  """
  let jsonData = jsonString.data(using: .utf8)! // 인터넷에서 필요한 자료를 받은 형태

  do {
    // 데이터형태는 isValible.... 이 안됨, 무조건 false로 나오기 때문에. 그냥 try 쓰셈
    // 옵션이 필요없다.
    let foundationObject = try JSONSerialization.jsonObject(with: jsonData)

    if let jsonDict = foundationObject as? [String: Any] {
      print(jsonDict)
    }
  } catch {
    print(error.localizedDescription)
  }
}

//print("\n---------- [ jsonObjectWithData ] ----------\n")
//jsonObjectWithData()


//: ## JSON Object with InputStream
private func jsonObjectWithInputStream() {
  // 위에서 아웃풋스트림해준걸 inputStream 해주는 것
  let jsonFilePath = "myJsonFile.json"
  let inputStream = InputStream(fileAtPath: jsonFilePath)!
  inputStream.open()
  defer { inputStream.close() }
  
  guard inputStream.hasBytesAvailable else { return }
  
  do {
    let jsonObject = try JSONSerialization.jsonObject(with: inputStream)
    print(jsonObject)
  } catch {
    print(error.localizedDescription)
  }
}

//print("\n---------- [ jsonObjectWithInputStream ] ----------\n")
//jsonObjectWithInputStream()

//: [Next](@next)

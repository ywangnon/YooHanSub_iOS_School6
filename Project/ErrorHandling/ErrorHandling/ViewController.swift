//
//  ViewController.swift
//  ErrorHandling
//
//  Created by Hansub Yoo on 2018. 3. 15..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    /********************************************
     func write(
     to url: URL,
     atomically useAuxilaryFile: Bool,
     encoding enc: String.Encoding
     ) throws //-> ()
     
     - throw 키워드
     ********************************************/
    
    private let tmpDir = NSTemporaryDirectory()
    private let filePath = NSTemporaryDirectory() + "swift.txt"
    private let errorFilePath = NSTemporaryDirectory() + "noFile.txt"
    
    enum MyError: Error {
        case errorExample
        case errorWithParam(num: Int)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        throwsFunctionExample()
    }

    private func createDummyFile() {
        let swift = "Swift Error handling"
        try? swift.write(toFile: filePath, atomically: true, encoding: .utf8)
    }
    
    private func basic() {
        print("\n----------- [ basic ] -----------\n")
        let swift = "Swift Error Handling"
        do {
            try swift.write(toFile: tmpDir, atomically: true, encoding: .utf8) // Error (tmpDir is Directory)
//            try? swift.write(toFile: tmpDir, atomically: true, encoding: .utf8) //? 작성시 오류나도 밑에 줄까지 작성됨
//            try! swift.write(toFile: tmpDir, atomically: true, encoding: .utf8) //! 작성시 오류나면 죽음
            try swift.write(toFile: filePath, atomically: true, encoding: .utf8) // No Error
        } catch { // <- catch 만 입력 시 기본적으로  let error 를 사용한 것과 동일
            print(error)
            print(error.localizedDescription)
        }
    }
    
    /********************************************
     do ~ catch 블럭에서 위와 같이 첫 번째 try 문에서 에러가 발생하면 해당 코드 이후의 내용들은 실행되지 않음.
     즉, Error 가 나지 않는 두 번째 try 구문은 실행되지 않음으로 주의
     ********************************************/
    
    private func throwsFunctionExample() {
        print("\n -------------- [ throwsFunctionExample ] -----------------\n")

        do {
            try throwsNSError()
        } catch {
            print("Error :", error)
            print("Error LocalizedDescription :", error.localizedDescription)

            let e = error as NSError
            print("nserror :", e)
            print("domain :", e.domain)
            print("domain :", e.code)
            print("userInfo :", e.userInfo)
        }
        
        print("=====================[ Custom Error ]=====================")
        do {
            try throwError()
        } catch {
            print("Error :", error)
            print("Error LocalizedDescription :", error.localizedDescription)

            let e = error as NSError
            print("nserror :", e)
            print("domain :", e.domain)
            print("domain :", e.code)
            print("userInfo :", e.userInfo)
        }
        print("=====================[ Matching Error ]=====================")
        
        do {
            try throwError()
        } catch MyError.errorExample {
            print("errorExample")
        } catch MyError.errorWithParam(let num) {
            print("error with number param:", num)
        } catch {
            print("The error is not MyError")
        }
    }
    
    private func throwsNSError() throws {
        throw NSError(domain: "domian data", code: 55, userInfo: ["somethings":1])
    }
    
    private func throwError() throws {
//        try "1".write(toFile: tmpDir, atomically: true, encoding: .utf8) // 에러나는 키워드, throw로 던짐
        throw MyError.errorWithParam(num: 10)
        //둘 중 하나만 쓰면 됨
    }
    
    private func someRethowsFunction(_ fn: () throws -> ()) rethrows {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func deferOrder() {
        print("start")
        defer { print("defer1") }
        print("center")
        defer {
            print("defer2")
            defer {
                print("defer4")
                defer {
                    print("defer5")
                }
            }
        }
        defer { print("defer3") }
        print("end")
        
//        var i = 0
//        while i == 0 {
//            defer { i += 1 }
//        }//true 무한반복이지만 무조건 실행되서 빠져나간다.
    }
    
    
}


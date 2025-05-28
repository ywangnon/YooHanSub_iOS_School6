//
//  ViewController.swift
//  SandboxDirectoryTest
//
//  Created by giftbot on 2018. 2. 28..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

/***************************************************
 iOS 11 기준 초기 디렉토리  (iOS 11에서 SystemData 생김)
 [".com.apple.mobile_container_manager.metadata.plist", "Library", "Documents", "tmp", "SystemData"]
 ***************************************************/

/***************************************************
 - Backup 과 iTunes 의 파일 공유, 파일앱에서의 컨트롤은 관계 없다.
   백업은 말 그대로 백업을 위한 것이고 파일 공유 및 파일앱은 로컬 파일에 접근하는 것.
 
 - 파일앱에서 내 앱을 보려면 반드시 documents 에 파일이 있어야만 뜸.
 - Read, Write 권한 같은 건 시뮬레이터에서 테스트 하지 말 것.  실제 기기와 다르게 동작함.
 - string 보다는 url을 사용하는 것이 좋음.
   ex) try? ("string" as NSString).write(to: <#T##URL#>, atomically: <#T##Bool#>, encoding: <#T##UInt#>)
       try? ("string" as NSString).write(toFile: <#T##String#>, atomically: <#T##Bool#>, encoding: <#T##UInt#>)
 ***************************************************/

final class ViewController: UIViewController {
  
  let fileManager = FileManager.default
  let docu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
  let library = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)[0]
  let tmp = NSTemporaryDirectory()
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    let fileName = "/text.txt"
//    writeDummyFile(at: docu, filePath: fileName)
    
//    baseContainers()
//    dataContainer()
//    unavailableDirectories()

//    print(isExcludedFromBackup(at: docu))
    
//    print(excludeFileFromBackup(at: docu + fileName))
//    contents(atPath: docu)
//    deleteAllDocumentsFiles()
  }

  private func baseContainers() {
    // 번들 컨테이너, 데이터 컨테이너  (쓰기 및 삭제 불가, 읽기, 실행만 가능)
    let bundlePath = Bundle.main.bundlePath
    let homePath = NSHomeDirectory()
    checkAvailable(atPath: bundlePath)
    checkAvailable(atPath: homePath)
  }

  private func dataContainer() {
    // NSHomeDirectory + "Documents" 같은 형식으로 써주어도 무방함.
    
//    documentsDataContainer()
    libraryDataContainer()
//    tmpDataContainer()

//    let contents = try? fileManager.contentsOfDirectory(atPath: path)
//    print(contents)
//    deleteAllDocumentsFiles()
    
    /***************************************************
     참고
     ===
     이 디렉토리들은 Library 디렉토리 내에 만들어지기 때문에 생성만 하면 사용 가능하긴 하지만 macOS 를 위한 것이므로 굳이 쓸 일 없음.
     - NSSearchPathForDirectoriesInDomains(.autosavedInformationDirectory, .userDomainMask, true)[0],
     - NSSearchPathForDirectoriesInDomains(.inputMethodsDirectory, .userDomainMask, true)[0],
     - NSSearchPathForDirectoriesInDomains(.preferencePanesDirectory, .userDomainMask, true)[0]
     ***************************************************/
  }
  
  // MARK: - documents
  
  private func documentsDataContainer() {
    let document = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    let docuInbox = document + "/Inbox"
    print("document :", document)
    print("docuInbox :", docuInbox)
    checkAvailable(atPath: document)
    checkAvailable(atPath: docuInbox)
    if let contents = try? fileManager.contentsOfDirectory(atPath: docuInbox) {
      print(contents)
      checkAvailable(atPath: docuInbox + "/" + contents.last!)
    }
  }
  
  // MARK: - library
  
  private func libraryDataContainer() {
    let appSupport = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)[0]
    let caches = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
    
    print("\n-------------------- [ library ] --------------------\n")
    print("library :", library)
//    checkAvailable(atPath: library)
//    writeDummyFile(at: library + "/text.txt")
//    checkAvailable(atPath: library + "/text.txt")
    
    print("\n-------------------- [ appSupport ] --------------------\n")
    print("application support :", appSupport)
    if !fileManager.fileExists(atPath: appSupport) {
      try? fileManager.createDirectory(atPath: appSupport, withIntermediateDirectories: true, attributes: nil)
    }
//    checkAvailable(atPath: appSupport)
//    writeDummyFile(at: appSupport + "/text.txt")
//    checkAvailable(atPath: appSupport + "/text.txt")
    
    print("\n-------------------- [ caches ] --------------------\n")
    print("caches :", caches)
    if !fileManager.fileExists(atPath: caches) {
      try? fileManager.createDirectory(atPath: caches, withIntermediateDirectories: true, attributes: nil)
    }
//    checkAvailable(atPath: caches)
//    writeDummyFile(at: caches + "/text.txt")
//    checkAvailable(atPath: caches + "/text.txt")
    
    contents(atPath: library)

    let preferences = library + "/Preferences"
    deleteItem(atPath: preferences)
    
    do {
      try fileManager.createDirectory(atPath: preferences, withIntermediateDirectories: true, attributes: nil)
    } catch {
      print(error.localizedDescription)
    }
    writeDummyFile(at: preferences + "/test1.txt")
    contents(atPath: library)
    contents(atPath: preferences)
  }
  
  // MARK: - Temporary
  
  private func tmpDataContainer() {
//    let tmpInbox = tmp + Bundle.main.bundleIdentifier! + "-Inbox"
//    print("tmpInbox :", tmpInbox)
    // ex) tmp/kr.giftbot.tutorial-Inbox
    
//    deleteItem(atPath: tmp)
//    contents(atPath: NSHomeDirectory())
//    writeDummyFile(at: tmp)
    contents(atPath: tmp)
    
//    checkAvailable(atPath: tmp)
//    checkAvailable(atPath: tmpInbox)
//    contents(atPath: tmpInbox)
  }
  
  // MARK: - Helpers
  
  private func deleteAllDocumentsFiles() {
    // Documents 디렉토리 내 전체 파일을 삭제하고 싶을 때 그냥 디렉토리 자체를 삭제 대상으로 지정하면
    // 디렉토리 내의 모든 파일 및 디렉토리가 삭제 됨. Documents 디렉토리는 삭제 불가능하기 때문에 남아 있음.
    // Inbox 가 있다면 해당 디렉토리만 남고 역시 그 내부의 파일들은 다 삭제됨.
    let document = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    try? fileManager.removeItem(atPath: document)
    
    //  이렇게 개별 삭제 필요 없음.
    //    guard let contents = try? fileManager.contentsOfDirectory(atPath: document) else { return }
    //    for content in contents {
    //      do {
    //        try fileManager.removeItem(atPath: document + "/" + content)
    //      } catch {
    //        print(error.localizedDescription)
    //      }
    //    }
  }
  
  @discardableResult
  private func deleteItem(atPath path: String) -> Bool {
    do {
      try fileManager.removeItem(atPath: path)
      return true
    } catch {
      print(error.localizedDescription)
      return false
    }
  }
  
  private func unavailableDirectories() {
    /***************************************************
     mac 또는 시스템 용 디렉토리여서 읽기 / 쓰기 모두 불가능한 디렉토리들.
     ***************************************************/
    let unavailables = [
      NSSearchPathForDirectoriesInDomains(.allApplicationsDirectory, .userDomainMask, true)[0],
      NSSearchPathForDirectoriesInDomains(.applicationDirectory, .userDomainMask, true)[0],
      NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true)[0],
      NSSearchPathForDirectoriesInDomains(.demoApplicationDirectory, .userDomainMask, true)[0],
      NSSearchPathForDirectoriesInDomains(.desktopDirectory, .userDomainMask, true)[0],
      NSSearchPathForDirectoriesInDomains(.developerDirectory, .userDomainMask, true)[0],
      NSSearchPathForDirectoriesInDomains(.developerApplicationDirectory, .userDomainMask, true)[0],
      // 등등
      ]
    
    for path in unavailables {
      if fileManager.isReadableFile(atPath: path) ||
        fileManager.isWritableFile(atPath: path) ||
        fileManager.isDeletableFile(atPath: path) ||
        fileManager.isExecutableFile(atPath: path
        ) {
        print(path)
        print("Readable :", fileManager.isReadableFile(atPath: path))
        print("Writable :", fileManager.isWritableFile(atPath: path))
        print("Deletable :", fileManager.isDeletableFile(atPath: path))
        print("Executable :", fileManager.isExecutableFile(atPath: path))
      }
    }
  }
  
  private func contents(atPath: String) {
    do {
      let contents = try fileManager.contentsOfDirectory(atPath: atPath)
      print(contents)
    } catch {
      print(error.localizedDescription)
    }
  }
  
  private func writeDummyFile(at dirPath: String, filePath: String = "/text.txt") {
    let file = dirPath + filePath
    do {
      try fileManager.createDirectory(atPath: dirPath, withIntermediateDirectories: true, attributes: nil)
      try ("documents" as NSString).write(toFile: file, atomically: true, encoding: String.Encoding.utf8.rawValue)
    } catch {
      print(error.localizedDescription)
    }
  }
  
  func isExcludedFromBackup(at filePath: String) -> Bool {
    let url = URL(fileURLWithPath: filePath)
    let values = try? url.resourceValues(forKeys: [.isExcludedFromBackupKey])
    return values!.isExcludedFromBackup ?? false
  }
  

  @discardableResult //사용 안해도 상관없다.
  func excludeFileFromBackup(at filePath: String, restore: Bool = false) -> Bool {
    var url = URL(fileURLWithPath: filePath)
    do {
      var values = try url.resourceValues(forKeys: [.isExcludedFromBackupKey])
      let isExcluded = values.isExcludedFromBackup ?? false
      print("isExcluded :", isExcluded)
      guard !isExcluded || restore else { return true }
      
      values.isExcludedFromBackup = !restore
      print("new Value :", !restore)
      try url.setResourceValues(values)
      return true
    } catch {
      print(error.localizedDescription)
      return false
    }
  }
  
  private func checkAvailable(atPath path: String) {
    print(path)
    print("Readable :", fileManager.isReadableFile(atPath: path))
    print("Writable :", fileManager.isWritableFile(atPath: path))
    print("Deletable :", fileManager.isDeletableFile(atPath: path))
    print("Executable :", fileManager.isExecutableFile(atPath: path))
  }
  
}


//
//  AppDelegate.swift
//  SandboxDirectoryTest
//
//  Created by giftbot on 2018. 2. 28..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    //  window = UIWindow(frame: UIScreen.main.bounds)
    //  window?.backgroundColor = .white
    //  window?.rootViewController = ViewController()
    //  window?.makeKeyAndVisible()
    return true
  }

  func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
    print("\n-------------------- [ open url ] --------------------\n")
    print(url)
    
    guard let source = options[.sourceApplication] as? String,
      let openInPlace = options[.openInPlace] as? Bool
      else { return true }
    print(source)
    print(openInPlace)

    if let annotation = options[.annotation] {
      print(annotation)
    }
    return true
  }

}


// 현재 파일앱에서 아이템 여러 개 선택 후 share 했을 때
// 한 개의 파일만 import 되는 버그가 있음.

/***************************************************
 UIApplicationOpenURLOptionsKey
 ==============================
 sourceApplication
 - 앱을 열게 한 소스앱. ex) com.apple.DocumentsApp (파일앱)  , com.apple.mobilemail (메일앱)  ,  com.apple.Keynote(키노트)  ,  com.iwilab.KakaoTalk(카카오톡)
 
 openInPlace : 기본값 false,
 - 액세스 권한을 유지하기 위해 문서를 사용하기 전에 반드시 복사한 뒤 사용 해야 함.
 문서를 복사할 필요가 없는 경우 application(_:open:options:) 메서드 내에서 해당 문서를 바로 열 수 있음
 앱에서 iCloud 문서를 바로 열 수 있는지 여부를 선언하는 방법은 LSSupportsOpeningDocumentsInPlace 키 참고
 - LSSupportsOpeningDocumentsInPlace - Enables your app to directly open original documents
 값을 YES 로 설정하면, 문서 사본이 아닌 파일 제공자의 원본 문서를 열 수 있게 됨.
 opening documents in place 를 지원하는 시스템의 로컬 파일 프로바이더, 아이클라우드 파일 프로바이더, 써드파티 파일 프로바이더 의 문서에 접근 가능
 - 중요 : 문서를 제자리에서 열면 다른 프로세스가 언제든 문서를 수정할 수 있다.
 따라서 UIDocument 하위 클래스 또는 NSFilePresenter 또는 NSFileCoordinator 객체를 사용해 문서에 대한 액세스를 조정해야 한다.
 - iOS 11 에서 이 키와 UIFileSharingEnabled 키가 모두 YES 면 로컬 파일 provider 는 앱의 Documents 디렉토리에 있는 모든 문서에 대한 액세스 권한을 부여.
 이러한 문서들은 파일 앱 및 document browser에 나타나고, 유저는 이 문서의 원본을 바로 열고 편집할 수 있다.
 
 // 메인 첨부파일, 카톡 다운로드 파일 은 documents/inbox 로 들어옴
 // 키노트, iCloud 등은 tmp/inbox 로 들어옴
 
 // inPlace 값이 1일 때 (원본 주소)  (각각 메일, 파일앱 iCloud, 파일앱의 다른 앱, 구글드라이브 순)
 // file:///private/var/mobile/Containers/Data/Application/AB979521-8087-47BE-8BA4-734708907D4B/Documents/Inbox/test-4.pdf
 // file:///private/var/mobile/Library/Mobile%20Documents/com~apple~CloudDocs/Desktop/UITextViewTest/UITextViewTest/ViewController.swift
 // file:///private/var/mobile/Containers/Data/Application/ECCFC283-3827-46D5-908C-D80E8FFBB940/Documents/text.txt
 // file:///private/var/mobile/Containers/Shared/AppGroup/93023004-FB74-4D85-B9E1-C7540DD67270/File%20Provider%20Storage/21472873/1yqcBD60iJmn7KUUnfaOO5Jim-UHEEhhZsmGdivo4-ts/%E1%84%80%E1%85%A1%E1%84%80%E1%85%A8%E1%84%87%E1%85%AE.gsheet
 
 // inPlace 값이 0일 때  (메일, iCloud, 다른 앱 순)
 // file:///private/var/mobile/Containers/Data/Application/4C58CD34-82B7-4F3A-BA0E-0A4E7859FEF5/Documents/Inbox/test-3.pdf
 // file:///private/var/mobile/Containers/Data/Application/4C58CD34-82B7-4F3A-BA0E-0A4E7859FEF5/tmp/kr.giftbot.tutorial-Inbox/ViewController.swift
 // file:///private/var/mobile/Containers/Data/Application/4C58CD34-82B7-4F3A-BA0E-0A4E7859FEF5/tmp/kr.giftbot.tutorial-Inbox/text.txt
 
 Annotation : 기본값 [:]
 - UIDocumentInteractionController 객체의 annotation 속성으로 전달되는 정보를 포함.
 - 값은 property list-typed object
 ***************************************************/


// 한 번 등록되고 나면 다른 프로젝트에서 동일한 BundleID 를 사용할 경우
// 해당 프로젝트에서는 문서 타입이 등록되어 있지 않은데도
// DocumentInteraction 대상으로 나올 수가 있다. iOS 시스템 버그인 듯.

//[ Info.plist Documents Type 예시 ]
//<key>CFBundleDocumentTypes</key>
//<array>
//<dict>
//<key>CFBundleTypeName</key>
//<string>All Document Types</string>
//<key>LSHandlerRank</key>
//<string>Default</string>
//<key>LSItemContentTypes</key>
//<array>
//<string>public.item</string>
//</array>
//</dict>
//</array>



/***************************************************
 open url example
 =======
 -------------------- [ mail app ] --------------------
 file:///private/var/mobile/Containers/Data/Application/471D773C-6C12-48F5-9374-7C1A7E81EE0B/Documents/Inbox/test.pdf
 com.apple.mobilemail
 false
 -------------------- [ 파일앱 ] --------------------
 file:///private/var/mobile/Library/Mobile%20Documents/com~apple~ScriptEditor2/Documents/%E1%84%86%E1%85%AE%E1%84%8C%E1%85%A6.scpt
 com.apple.DocumentsApp
 true
 -------------------- [ other app by documentinteraction ] --------------------
 file:///private/var/mobile/Containers/Data/Application/471D773C-6C12-48F5-9374-7C1A7E81EE0B/Documents/Inbox/iPhone.png
 kr.giftbot.example
 false
 -------------------- [ keynote ] --------------------
 file:///private/var/mobile/Library/Mobile%20Documents/com~apple~Keynote/Documents/%E1%84%91%E1%85%B3%E1%84%85%E1%85%A6%E1%84%8C%E1%85%A6%E1%86%AB%E1%84%90%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%89%E1%85%A7%E1%86%AB.key
 com.apple.Keynote
 true
 -------------------- [ 파일앱 ] --------------------
 file:///private/var/mobile/Containers/Data/Application/43C21F35-7B7D-4E71-BCBD-3BBD9827007C/tmp/kr.giftbot.demo-Inbox/SA_Beat.mp3
 com.apple.DocumentsApp
 false
 ***************************************************/

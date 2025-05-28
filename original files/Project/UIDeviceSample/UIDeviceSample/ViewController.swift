//
//  ViewController.swift
//  UIDeviceSample
//
//  Created by Hansub Yoo on 2018. 3. 26..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

/********************************************
 UIDevice
 - 디바이스 이름 / 모델 / 화면 방향 등
 - OS 이름 / 버전
 - 인터페이스 형식 (phone, pad, tv 등)
 - 배터리 정보
 - 근접 센서 정보
 - 멀티태스킹 지원 여부
 ********************************************/

class ViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!
    let device = UIDevice.current
    
    @IBAction private func systemVersion() {
        /********************************************
         Version: Major, Minor (public), Minor (non-public)
         ********************************************/
        print("\n---------- [ System Version ] ----------\n")
        print("System Name :", device.systemName)
        print((device.systemVersion as NSString).floatValue)
        
        let systemVersion = device.systemVersion
        print(systemVersion)
        
        let splitVersion = systemVersion.split(separator: ".").flatMap { Int($0) }
        print(splitVersion)
        
        if splitVersion.count > 2 {
            label.text =
            "\(splitVersion[0]).\(splitVersion[1]).\(splitVersion[2])"
        } else {
            label.text =
            "\(splitVersion[0]).\(splitVersion[1])"
        }
    }
    
    @IBAction private func architecture() {
        print("\n---------- [ Architecture ] ----------\n")
        #if (arch(i386) || arch(x86_64)) && os(iOS)
            print("Simulator")
            label.text = "Simulator"
        #else
            print("Device")
            label.text = "Device"
        #endif
        
        // 1101111000 simulatorlator
        // 1100011001 device remark
        print("TARGET_OS_MAC : ", TARGET_OS_MAC)
        
    }
    
    @IBAction private func deviceModel() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


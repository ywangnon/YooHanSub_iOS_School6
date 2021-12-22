//
//  ViewController.swift
//  CalculatorSwift
//
//  Created by Hansub Yoo on 2018. 1. 12..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /// storyboard 연결
    @IBOutlet weak var firstNumDisplay: UILabel!
    @IBOutlet weak var secondNumDisplay: UILabel!
    @IBOutlet weak var resultDisplay: UILabel!
    
    /// 누른 연산자 저장소
    var operationTemp: String = ""
    
    var firstNum: String = "0"
    var secondNum: String = "0"
    var resultNum: String = "0"
    
    /// 코드가 시작하는 곳
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Int.max)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - Action Method
    
    /// 숫자 누르는 연산자
    /// 연산자가 저장되어 있으면 두번째 화면에 숫자 입력
    /// 처음 연산자가 0이면 누른 숫자 입력, 아니면 화면의 숫자 뒤에 입력한 숫자를 붙임
    /// - Parameter sender: 버튼
    @IBAction func clickDidNumber(_ sender: UIButton) {
        //버튼에 있는 텍스트 가져오기
        let numberStr = sender.titleLabel!.text!
        //연산자 유무 확인
        if operationTemp.count > 0
        {
//            let secondDisplay = secondNumDisplay.text!
            if secondNum == "0"
            {
//                secondNumDisplay.text = numberStr
                secondNum = numberStr
            }else
            {
//                secondNumDisplay.text = secondNumDisplay.text! + numberStr
                secondNum = secondNum + numberStr
            }
            
            secondNumDisplay.text = secondNum
        }else
        {
//            let firstDisplay = firstNumDisplay.text!
            if firstNum == "0"
            {
//                firstNumDisplay.text = numberStr
                resetDisplay()
                firstNum = numberStr
            }else
            {
//                firstNumDisplay.text = firstNumDisplay.text! + numberStr
                firstNum = firstNum + numberStr
            }
            
            firstNumDisplay.text = firstNum
        }
    }
    
    /// 연산자 액션
    /// 첫번째 화면에 숫자가 입력되어 있으면 연산자 저장소에 연산자 저장
    /// - Parameter sender: 버튼
    @IBAction func clickDidOperation(_ sender: UIButton) {
        let operStr = sender.titleLabel!.text!
        
//        let firstDiplay = firstNumDisplay.text!
        if firstNum != "0"
        {
            operationTemp = operStr
            changeColor(by: operStr)
        }
    }
    
    /// 데이터 리셋
    @IBAction func clickDidCancel(_ sender: UIButton) {
        print("did Cancel")
        resetData()
        resetDisplay()
       
    }
    
    @IBAction func clickDidResult(_ sender: UIButton) {
        
//        let secondNumStr = secondNumDisplay.text!
        if secondNum != "0"
        {
            let firstNumTemp: Int = Int(firstNum)!
            let secondNumTemp: Int = Int(secondNum)!
            let op: String = operationTemp
            
            let resultNum = calculation(firstNum: firstNumTemp, operation: op, secondNum: secondNumTemp)
            resultDisplay.text = String(resultNum)
            resetData()
        }
    }
    
    //MARK: - Private Method
    
    /// 연산 함수
    /// 두 수를 연산하고 결과값을 리턴
    ///
    /// - Parameters:
    ///   - firstNum: 첫번째 디스플레이에 표시된 숫자
    ///   - operation: 연산자
    ///   - secondNum: 두번째 디스플레이에 표시된 숫자
    /// - Returns: 연산 결과값
    private func calculation(firstNum: Int, operation: String, secondNum: Int) -> Int
    {
        var resultNum: Int = 0
        
        switch operation {
        case "+":
            print("더하기 연산")
            resultNum = firstNum + secondNum
        case "−":
            print("빼기 연산")
            resultNum = firstNum - secondNum
        case "×":
            print("곱하기 연산")
            resultNum = firstNum * secondNum
        case "÷":
            print("나누기 연산")
            resultNum = firstNum / secondNum
        default:
            print("여기 걸리면 에러임")
        }
        
        return resultNum
    }
    
    /// UI 리셋
    private func resetDisplay() {
        firstNumDisplay.text = "0"
        secondNumDisplay.text = "0"
        resultDisplay.text = "0"
        changeTextColor(color: .cyan)
    }
    
    /// 데이터 리셋
    private func resetData()
    {
        firstNum = "0"
        secondNum = "0"
        resultNum = "0"
        operationTemp = ""
    }
    
    private func changeColor(by operation: String)
    {
        var color: UIColor
        
        switch operation {
        case "+":
           color = .red
        case "−":
           color = .yellow
        case "×":
           color = .green
        case "÷":
            color = .blue
        default:
            color = .white
            print("여기 걸리면 에러임")
        }
        
        changeTextColor(color: color)
    }
    private func changeTextColor(color:UIColor)
    {
        firstNumDisplay.textColor = color
        secondNumDisplay.textColor = color
        resultDisplay.textColor = color
    }
    
}


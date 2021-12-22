//
//  ViewController.swift
//  AnimationSample
//
//  Created by Hansub Yoo on 2018. 3. 20..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    struct Time {
        static let short = 0.3
        static let middle = 0.65
        static let long = 1.0
    }
    
    private struct UI {
        static let menuCount = 6
        static let menuSize: CGFloat = 60
        static let distance: CGFloat = 100
        static let minScale: CGFloat = 0.1
    }
    
    private var firstMenuContainer: [UIButton] = []
    private var secondMenuContainer: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupFirstMenu()
        setupSecondMenu()
    }
    
    private func randomNumberGenerator(maximum: UInt32) -> CGFloat {
        return CGFloat(arc4random_uniform(maximum))
    }
    
    private func randomColorGenerator() -> UIColor {
        let red = randomNumberGenerator(maximum: 255) / 255.0
        let green = randomNumberGenerator(maximum: 255) / 255.0
        let blue = randomNumberGenerator(maximum: 255) / 255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    private func makeMenuButtonWith(frame: CGRect, title: String) -> UIButton {
        let button = UIButton(frame: frame)
        button.backgroundColor = randomColorGenerator()
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = button.bounds.width/2
        button.transform = button.transform.scaledBy(x: UI.minScale, y: UI.minScale)
        view.addSubview(button)
        return button
    }
    
    
    
    func setupFirstMenu() {
        for i in (0..<UI.menuCount) {
            let menuFrame = CGRect(x: 50, y: view.bounds.height - 110, width: UI.menuSize, height: UI.menuSize)
            let button = makeMenuButtonWith(frame: menuFrame, title: "버튼\(i)")
            firstMenuContainer.append(button)
            
            if i == 0 {
                button.transform = .identity
                button.addTarget(self, action: #selector(firstMenuDidTap), for: .touchUpInside)
            }
        }
        view.bringSubview(toFront: firstMenuContainer.first!)
    }
    
    func setupSecondMenu() {
        for i in (0..<UI.menuCount) {
            let menuFrame = CGRect(x: 250, y: view.bounds.height - 110, width: UI.menuSize, height: UI.menuSize)
            let button = makeMenuButtonWith(frame: menuFrame, title: "버튼\(i)")
            secondMenuContainer.append(button)
            
            if i == 0 {
                button.transform = .identity // 단위행렬
                button.addTarget(self, action: #selector(secondMenuDidTap), for: .touchUpInside)
            }
        }
        view.bringSubview(toFront: secondMenuContainer.first!)
        //앞이 아니라 뒤에 쌓인다.
    }
    
    @objc func firstMenuDidTap(_ button: UIButton) {
        print("\n---------- [ usingSpringWithDamping ] ----------\n")
        button.isSelected = !button.isSelected
        
        UIView.animate(withDuration: Time.middle, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: { [firstMenuContainer] in
            for (idx, menu) in firstMenuContainer.enumerated() {
                guard idx != 0 else { continue }
                if button.isSelected {
                    menu.transform = .identity//원래크기로돌리기 단위행렬
//                    CATransform3D 3차 행렬
                    menu.frame.origin.y -= UI.distance * CGFloat(idx)//인덱스값에 따라
                } else {
                    menu.transform = menu.transform.scaledBy(x: UI.minScale, y: UI.minScale)//원래크기의 각 변수에에 곱하기
                    menu.frame.origin.y += UI.distance * CGFloat(idx)
                }
            }
        })
    }

    @objc func secondMenuDidTap(_ button: UIButton) {
        print("\n---------- [ animateKeyframes ] ----------\n")
        button.isSelected = !button.isSelected
        
        UIView.animateKeyframes(withDuration: Time.middle, delay: 0, options: [.beginFromCurrentState], animations: { [secondMenuContainer] in
            var startTime = 0.0
            var duration = 1.0 / Double(UI.menuCount)
            
            for i in 1..<UI.menuCount {
                defer { startTime += duration }
                UIView.addKeyframe(withRelativeStartTime: startTime, relativeDuration: duration, animations: {
                    if button.isSelected {
                        secondMenuContainer[i].transform = .identity
                        secondMenuContainer[i].transform = secondMenuContainer[i].transform.translatedBy(x: CGFloat(-30 * i), y: 0)//값만큼 평행이동 시켜줌
                        secondMenuContainer.enumerated().filter {return $0.offset >= i }.forEach { $0.element.frame.origin.y -= UI.distance }//적용된 앞의 버튼에는 적용되지 않고, 그 이후의 버튼에만 적용된다.
                    } else {
                        let minimumScaleTransform = CGAffineTransform.identity.scaledBy(x: UI.minScale, y: UI.minScale)
                        
                        secondMenuContainer[UI.menuCount - i].transform = minimumScaleTransform
                        secondMenuContainer.enumerated().filter { return $0.offset >= UI.menuCount - i }.forEach { $0.element.frame.origin.y += UI.distance }
                    }
                })
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


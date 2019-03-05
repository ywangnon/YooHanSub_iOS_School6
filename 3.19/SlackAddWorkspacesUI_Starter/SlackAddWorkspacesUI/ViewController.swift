//
//  ViewController.swift
//  SlackAddWorkspacesUI
//
//  Created by giftbot on 2018. 3. 16..
//  Copyright © 2018년 giftbot. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices

final class ViewController: UIViewController {
    
    // MARK: Properties
    
    @IBOutlet private weak var nextButton: UIButton!
    @IBOutlet private weak var dismissButton: UIButton!
    @IBOutlet private weak var urlTextField: UITextField!
    @IBOutlet private weak var placeholderLabel: UILabel!
    
    // Constraints
    @IBOutlet private weak var placeholderLabelLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var dontKnowURLLabelBottomConstraint: NSLayoutConstraint!
    // 직접 isActive를 true, false로 바꾸면서 사용해도 된다. 그때는 선언 앞에 weak을 지워야한다. 메모리에서 설정이 지워질 수 있기 때문에
    
    // Segue Identifier
    private let nextVCModalSegue = "NextViewControllerModalSegue"
    
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.updateConstraintsIfNeeded()//호출한번 해줘야함
        
    }
    
    private var didUpdateConstraint = false
    // 완전한 코드로 짜면 안불릴수있음 -> updateConstraintsIfNeeded() 필요
    override func updateViewConstraints() {
        
        if !didUpdateConstraint {
            didUpdateConstraint = true
            
            // 서브뷰들까지 크기 조절해줌. 오토레이아웃과는 동시 사용 불가. 오토레이아웃시에는 false로 꺼주어야함
            nextButton.translatesAutoresizingMaskIntoConstraints = false
            nextButton
                .topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            nextButton
                .trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
            
            dismissButton.translatesAutoresizingMaskIntoConstraints = false
            dismissButton.leadingAnchor
                .constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
            dismissButton.centerYAnchor
                .constraint(equalTo: nextButton.centerYAnchor).isActive = true
            
            
        }
        super.updateViewConstraints()
    }
    
    @IBAction private func dismissButton(_ sender: UIButton) {
        urlTextField.resignFirstResponder()
        dismiss(animated: true)
    }
    
    @IBAction private func unwind(_ sender: UIStoryboardSegue) {
        print(sender.source)
    }
    
    
    
    // 밑줄
    //    private func underlineStyleByProgrammaticallyExample() {
    //        let buttonTitle = nextButton.title(for: .normal)!
    //        let mutableAttrStr = NSMutableAttributedString(string: buttonTitle)
    //        let attrKeys: [NSAttributedStringKey: Any] = [
    //            .underlineStyle: NSUnderlineStyle.styleSingle.rawValue,
    //            .underlineColor: UIColor.darkGray
    //        ]
    //        mutableAttrStr.addAttributes(attrKeys, range: NSRange(location: 0, length: buttonTitle.count))
    //        nextButton.setAttributedTitle(mutableAttrStr, for: .normal)
    //    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextVC = segue.destination as? NextViewController else { return }
        print(segue.destination)
        print(nextVC)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        guard identifier == nextVCModalSegue, nextButton.isSelected else {
            vibration()
            return false
        }
        return true
    }
    
    private func vibration() {
        AudioServicesPlaySystemSoundWithCompletion(kSystemSoundID_Vibrate) { [weak self] in
            DispatchQueue.main.async {
                self?.urlTextField.becomeFirstResponder()
            }
        }
    }
}

extension ViewController: UITextFieldDelegate {
    // when Press Enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if shouldPerformSegue(withIdentifier: nextVCModalSegue, sender: nil) {
            performSegue(withIdentifier: nextVCModalSegue, sender: nil)
        }
        return true
    }
    
    // when Change TextField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let text = textField.text ?? ""
        
        //        var replacedText = ""
        //        if string.isEmpty {
        //            if !text.isEmpty {
        //                let startIndex = text.startIndex
        //                let endIndex = text.index(text.endIndex, offsetBy: -1)
        //                replacedText = String(text[startIndex..<endIndex])
        //            }
        //        }else {
        //            replacedText = text.appending(string)
        //        }
        //        let replacedText = text.appending(string)
        
        let replacedText = (text as NSString).replacingCharacters(in: range, with: string)
        
        placeholderLabel.text = replacedText.isEmpty ? "your-url.slack.com" : ".slack.com"
        nextButton.isSelected = !replacedText.isEmpty
        
        let attrKey = [NSAttributedStringKey.font: textField.font!]
        let textWidthSize = (replacedText as NSString).size(withAttributes: attrKey).width
        
        //길이 제한
        //        guard textWidthSize < view.bounds.width - 120 else {
        //            return false
        //        }
        
        placeholderLabelLeadingConstraint.constant = textWidthSize
        
        return true
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        urlTextField.becomeFirstResponder()
        addKeyboardObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    private func addKeyboardObserver() {
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillShow, object: nil, queue: .main) {
            //            [weak self] in
            guard let userInfo = $0.userInfo,
                let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect,
                let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval,
                let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt
                else {return}
            print(keyboardFrame, duration, curve)
            UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions(rawValue: curve), animations: { 
                self.dontKnowURLLabelBottomConstraint.constant = keyboardFrame.height + 30
                self.view.layoutIfNeeded()
            })
        }
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: .main) {
            guard let userInfo = $0.userInfo,
                let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect,
                let duration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval,
                let curve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? UInt
                else {return}
            print(keyboardFrame, duration, curve)
            UIView.animate(withDuration: duration, delay: 0, options: UIViewAnimationOptions(rawValue: curve), animations: {
                self.dontKnowURLLabelBottomConstraint.constant = 30
                self.view.layoutIfNeeded()
            })
        }
    }
}

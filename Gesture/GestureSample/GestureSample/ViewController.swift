//
//  ViewController.swift
//  GestureSample
//
//  Created by youngmin joo on 2018. 3. 6..
//  Copyright © 2018년 youngmin joo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let gender = ["남성","여성","미표시"]
    
    let <#list#> = [<#element#>]
    
    @IBOutlet weak var tfTopConst: NSLayoutConstraint!
    
    @IBOutlet var tf:UITextField!
    
    var picker:UIPickerView!
    var toolbar:UIToolbar!
    var doneBtn:UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        tf.inputView = picker
        
        doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneBtnAction(_:)))
        
        toolbar = UIToolbar(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        

        toolbar.setItems([doneBtn], animated: false)
        
        tf.inputAccessoryView = toolbar
        
    }
    
    @objc func doneBtnAction(_ sender:UIBarButtonItem)
    {
        tf.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    ///MARK: -

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0 {
            return gender[row]
        }else 
        {
            return gender[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        let selectedTitle = self.pickerView(pickerView, titleForRow: row, forComponent: component)
        print(selectedTitle)
        self.tf.text = selectedTitle
    }
}







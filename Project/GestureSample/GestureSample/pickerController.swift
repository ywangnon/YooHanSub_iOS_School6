//
//  pickerController.swift
//  GestureSample
//
//  Created by Hansub Yoo on 2018. 3. 6..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class pickerController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var textFieldLb: UITextField!
    
    var picker: UIPickerView!
    var toolbar: UIToolbar!
    var barItem: UIBarButtonItem!
    
    var list: [String] = ["남자", "여자", "선택 안함"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldLb.inputView = picker
        textFieldLb.inputAccessoryView = toolbar
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

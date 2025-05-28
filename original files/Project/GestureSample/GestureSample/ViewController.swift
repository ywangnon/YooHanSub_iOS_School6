//
//  ViewController.swift
//  GestureSample
//
//  Created by Hansub Yoo on 2018. 3. 6..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var list1 = [1,2,3,4,5,6,7,8,9,10,11,12]
    var list2 = ["a","b","c","d","e","f","g","h"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0
        {
            return list1.count
        }else
        {
            return list2.count
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0
        {
            return "\(list1[row])"
        }else
        {
            return list2[row]
        }
        
    }

    @IBOutlet weak var tapCount: UILabel!
    @IBOutlet weak var tapPoint: UILabel!

    @IBOutlet weak var piker: UIPickerView!
    
    @IBOutlet weak var tapGesture: UITapGestureRecognizer!
    
    var pointTemp: CGPoint?
    var count: Int = 0
    
    @IBAction func taptap(_ sender: UITapGestureRecognizer)
    {
//        tapCount.text = "횟수: \(pointTouchCount(sender))"
//        tapPoint.text = "(\(tapGesture.location(in: controllerView))"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        piker.backgroundColor = UIColor.blue
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func pointTouchCount(_ sender: UITapGestureRecognizer) -> Int {
        if pointTemp == nil || pointTemp != sender.location(in: self.view)
        {
            count = 1
        }else if pointTemp == sender.location(in: self.view)
        {
            count += 1
        }
        
        pointTemp = sender.location(in: self.view)
        return count
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        tapCount.text = "\(touch.tapCount)"
        tapPoint.text = "\(touch.location(in: touch.view).x), \(touch.location(in: self.view).y)"
        
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  FirebaseSample
//
//  Created by Hansub Yoo on 2018. 3. 17..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    var ref: DatabaseReference!
    
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var valueTf: UITextField!
    @IBOutlet weak var deleteTf: UITextField!
    @IBOutlet weak var keyTf: UITextField!
    @IBOutlet weak var valueTf2: UITextField!
    @IBOutlet weak var valueTf3: UITextField!
    
    @IBAction func insertBtn(_ sender: Any) {
        
        let itemRef = ref.child((nameTf.text?.lowercased())!)
        itemRef.setValue(valueTf.text)
        
        nameTf.text = ""
        valueTf.text = ""
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        let itemRef = ref.child(deleteTf.text!)
        itemRef.removeValue { (error, ref) in
            if error != nil {
                print("error \(String(describing: error))")
            }
            
            self.deleteTf.text = ""
        }
    }
    
    @IBAction func selectBtn(_ sender: UIButton) {
        
        ref.child(keyTf.text!).observeSingleEvent(of: .value) { (DataSnapshot) in

            let value = DataSnapshot.value as? String
            let name = value

            self.valueTf2.text = value
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        //실행될 때 한번만 감시
        ref.observeSingleEvent(of: .value) { (DataSnapshot) in
            let value = DataSnapshot.value as? NSDictionary
            let name = value?["Name"] as? String ?? ""
            
        }
        
        ref.observe(.childAdded) { (DataSnapshot) in
            let data = DataSnapshot.value as? String
            self.valueTf3.text = data
        }
        
        
        //항상 감시
        ref.observe(.childAdded) { (DataSanpshot) in
            print("Data added")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


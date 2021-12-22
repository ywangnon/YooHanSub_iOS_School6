//
//  NextViewController.swift
//  TableViewTest
//
//  Created by Hansub Yoo on 2018. 2. 21..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class NextViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let frends: [String] = ["새친구1","새친구2","새친구3","새친구4","새친구5","새친구6"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cel.textLabel?.text = frends[indexPath.row]
        return cel
    }
    

    @IBOutlet var table:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

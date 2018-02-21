//
//  NRootView.swift
//  TableViewTest
//
//  Created by Hansub Yoo on 2018. 2. 21..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class NRootView: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let frends: [String] = ["친구1","친구2","친구3","친구4","친구5"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cel = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let table: UITableView = UITableView(frame: view.bounds, style: .grouped)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(table)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}

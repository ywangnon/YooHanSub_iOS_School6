//
//  TableView.swift
//  TableViewTest
//
//  Created by Hansub Yoo on 2018. 2. 21..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class TableView: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    let freinds: [String] = ["친구1","친구2","친구3","친구4","친구5","친구6","친구7","친구8","친구9","친구10"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return freinds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = freinds[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let title = cell?.textLabel?.text
        
//        let nextVC = UIViewController()
//        nextVC.view.backgroundColor = .white
//
//        let titleLB: UILabel = UILabel(frame: nextVC.view.bounds)
//        titleLB.text = title
//        titleLB.textAlignment = .center
//        nextVC.view.addSubview(titleLB)
//
//        self.present(nextVC, animated: true, completion: nil)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        
        let nextVC = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! NavigationController
        
        nextVC.text = title
        
        print("111111")
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let table: UITableView = UITableView(frame: view.bounds, style: .grouped)
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(table)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

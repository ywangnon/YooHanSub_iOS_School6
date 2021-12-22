//
//  ViewController.swift
//  TableViewTest
//
//  Created by Hansub Yoo on 2018. 2. 21..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("섹션당 로우 언제 불리냐")
        if section == 0
        {
            return 10
        }else
        {
            return 10
        }
    }
    //indexPath: section과 row의 정보를 가지고 있는 스트럭트
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("로우 셀 설정 언제 불리냐")
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //cell.textLabel?.text = "\(indexPath.row)||"
        
        if let count = cell.textLabel?.text?.count, count > 0
//        if var text:String = cell.textLabel?.text
        {
            print("우왕 \(indexPath.row)")
            cell.textLabel?.text! += "aa"
            // text += "aa"
        }else
        {
            print("츄웅 \(indexPath.row)")
            cell.textLabel?.text = "\(indexPath.row)" + "a"
        }
        
        if indexPath.row == 0
        {
            cell.backgroundColor = UIColor.blue
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        print("섹션 수 언제 불리냐")
        return 4
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let table: UITableView = UITableView(frame: self.view.bounds, style: .grouped)
//        table.dataSource = self//역할: 자료
//        table.delegate = self//역할: UI
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")//셀 형식 지정
//        print("테이블뷰 언제 불리냐")
//        view.addSubview(table)
        let lb: UILabel = UILabel(frame: view.bounds)
        lb.text = "이동"
        view.addSubview(lb)
        
        let btn: UIButton = UIButton(frame: view.bounds)
        btn.addTarget(self, action: #selector(moveToTable), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    @objc func moveToTable()
    {
//        let table: TableView = TableView()
//        let firstNavi: naviView = naviView(rootViewController: table)
//        self.present(firstNavi, animated: true, completion: nil)
        
//        let root: NRootView = NRootView()
//        let naviCon: NC = NC(rootViewController: root)
//        self.present(naviCon, animated: true, completion: nil)
        
        let tb = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController")
        self.present(tb!, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


//
//  ViewController.swift
//  IdolTable
//
//  Created by Hansub Yoo on 2018. 2. 28..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

let cellHeight: CGFloat = 50

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    /// Storyboard의 tableView
    @IBOutlet var tableView: UITableView!

//    lazy var friendList:[UserModel] = MainDataCenter.sharedInstance.friendList
    //타입 맞춰야하는데 maindatacenter에서 타입 조절해서 작성
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView의 기본 세팅
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    
    /// row of tableView per a section
    ///
    /// - Parameters:
    ///   - tableView: the tableview
    ///   - section: 하나의 섹션에 넣고 싶은 로우 수
    /// - Returns: 하나의 섹션에 들어가는 로우 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainDataCenter.sharedInstance.friendListCount
    }
    
    /// 로우에 들어가는 테이블뷰셀의 종류
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
        
        cell.cellData = MainDataCenter.sharedInstance.friendData(with: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //세그로 자동으로 뷰를 넘기기 때문에 여기서 할 수 가 없다.
        //전에는 여기서 뷰컨트롤러를 생성해서 그 뷰컨트롤러의 요소에 직접 넣었기 때문에 가능
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print("aaa")
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let nextVC = segue.destination as? DetailViewController,
        let cell = sender as? MainCell
        {
            nextVC.userData = cell.cellData
        }
    }
}


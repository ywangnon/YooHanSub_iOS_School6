//
//  ViewController.swift
//  TableView2
//
//  Created by Hansub Yoo on 2018. 2. 22..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var table: UITableView!
    
    var phone: [String] = ["엄마", "아빠", "친구1", "친구2", "동생", "형", "누나"]
    var message: [String] = ["나만의 손글씨로", "메모를 추가하여 메시지를 맞춤화할", "수 있습니다. 눈앞에서 직접", "작성되고", "있는 것 같은 애니메이션 메시지를", "가족과 친구에게 보낼 수 있습니다. 손글씨 메모를", "보내려면 다음 단계를 따릅니다."]
    
    //MARK : - UITableViewDataSource
    //테이블뷰의 row의 갯수를 테이블 뷰에게 알려주는 데이터 소스
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phone.count
    }
    
    //MARK : -
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.titleLB.text = phone[indexPath.row]
        cell.sub.text = message[indexPath.row]
        let date = Date() // --- 1
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss" // --- 2
        let stringDate = dateFormatter.string(from: date) // --- 3
        cell.nextLB.text = stringDate
        
        //cell에 데이터 할당
        //주의 UI변경시 계속 변함
        //데이터만 변해야한다.
        //모든 문제는 재사용때문에
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let msg: MessageView = self.storyboard?.instantiateViewController(withIdentifier: "MessageView") as! MessageView
        msg.navigationItem.title = phone[indexPath.row]
        msg.msg = message[indexPath.row]

        self.navigationController?.pushViewController(msg, animated: true)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "메시지"
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "편집", style: .plain, target: nil, action: nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "⎆", style: .plain, target: nil, action: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


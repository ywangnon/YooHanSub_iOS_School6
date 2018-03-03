//
//  SettingViewController.swift
//  IdolTable
//
//  Created by Hansub Yoo on 2018. 2. 28..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let DataInSection = SettingDataCenter.standard.settingList![section]["Data"] as! [[String:String]]
        let rowsNumofData = DataInSection.count
        
        return rowsNumofData
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var dataDic = SettingDataCenter.standard.settingList![indexPath.section]["Data"] as! [[String:String]]
        
        //        let title = SettingDataCenter.standard.settingList![indexPath.section]
        
        let cellStyle = dataDic[indexPath.row]["CellStyle"] as! String
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellStyle, for: indexPath)
        cell.textLabel?.text = dataDic[indexPath.row]["Content"]
        
        if cellStyle == "SettingBasicCell"
        {
            let basicCell = cell as! SettingBasicCell
            if SettingDataCenter.standard.settingList![indexPath.section]["SectionTitle"] as! String == "계정"
            {
                basicCell.textLabel?.textColor = UIColor.red
            }else if SettingDataCenter.standard.settingList![indexPath.section]["SectionTitle"] as! String == "정보"
            {
                basicCell.InfoLb.text = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
            }
        }
        
        return cell
    }
    
    //섹션 갯수
    func numberOfSections(in tableView: UITableView) -> Int {
        
        guard let sectionNumber = SettingDataCenter.standard.settingList?.count else {return 0}
        
        print(sectionNumber)
        
        return sectionNumber
    }
    
    
    //title 제목
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        guard let title = SettingDataCenter.standard.settingList![section]["SectionTitle"] else {return nil}
        
        return title as? String
    }
    
//    타이틀이 전체를 가리는 문제 발생
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


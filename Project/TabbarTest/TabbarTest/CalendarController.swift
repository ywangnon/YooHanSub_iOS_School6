//
//  CalendarController.swift
//  TabbarTest
//
//  Created by Hansub Yoo on 2018. 3. 5..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class CalendarController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var cal = Calendar.current
    var date = Date()
    var month: Int = 0
    var year: Int = 0
    
    var weekName: [String] = ["일","월","화","수","목","금","토"]
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var nMonth: UILabel!
    @IBOutlet var calTitle: UILabel!
    
    
    @IBAction func preMonth(_ sender: Any) {
    }
    
    @IBAction func nextMonth(_ sender: Any) {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let firstDay = cal.component(.weekday, from: date)
        print(firstDay)
        
        if section == 0
        {
            return weekName.count
        }else if section == 1
        {
            return 31 + self.setStartDay()
        }
        
        return 31
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarCell
        
        cell.cellTitle.textAlignment = .center
        
        if indexPath.section == 0
        {
            //월화수목금토일
            cell.backgroundColor = .cyan
            cell.cellTitle.text = weekName[indexPath.row]
            
        }else if indexPath.section == 1
        {
            //전 달의 마지막주 수
            //해당 달의 일 수
            
            if indexPath.row < setStartDay()
            {
                cell.cellTitle.text = ""
                cell.backgroundColor = .white
            }else
            {
                cell.cellTitle.text = "\(indexPath.row-self.setStartDay()+1)"
            }
        }
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        year = cal.component(.year, from: date)
        
        month = cal.component(.month, from: date)
        
        self.calTitle.text = "\(year) 년"
        self.nMonth.text = "\(month) 월"
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0
        {
            let size: CGSize = CGSize(width: collectionView.bounds.width/8, height: 30)
            return size
        }else
        {
            let size: CGSize = CGSize(width: collectionView.bounds.width/8, height: 40)
            return size
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    //섹션간 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 0, bottom: 0, right: 0)
    }
    
    func setStartDay() -> Int{
//        var startDay = DateComponents(calendar: cal, year: year, month: month, day: 1)
        let week = cal.component(.weekday, from: cal.date(from: DateComponents(year: year, month: month, day: 1))!)
        
        return week-1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

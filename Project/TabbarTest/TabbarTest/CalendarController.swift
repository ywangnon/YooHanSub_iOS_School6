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
            return 31
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
            
            cell.cellTitle.text = "\(indexPath.row+1)"
            
        }
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.calTitle.text = "\(cal.component(.year, from: date)) 년"
        self.nMonth.text = "\(cal.component(.month, from: date)) 월"
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

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    

}

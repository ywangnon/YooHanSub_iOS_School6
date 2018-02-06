//
//  MyCustomView.swift
//  DelegateSample
//
//  Created by Hansub Yoo on 2018. 2. 6..
//  Copyright © 2018년 hansub yoo. All rights reserved.
//

import UIKit

class MyCustomView: UIView {

    private var button: UIButton!
    var delegate: MyCustomViewDelegate?
    
    func a() {
        delegate?.didSelectedMyCustomView(view: self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = UIColor.brown
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createView()
    {
        button = UIButton()
        button.addTarget(self, action: #selector(self.btnHandler(_:)), for: .touchUpInside)
        button.frame = self.bounds
        self.addSubview(button)
    }
    
    @objc func btnHandler(_ sender: UIButton) {
        self.a()
    }
}

protocol MyCustomViewDelegate {
    func didSelectedMyCustomView(view: MyCustomView)
}

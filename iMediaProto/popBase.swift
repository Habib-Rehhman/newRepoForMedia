//
//  popBase.swift
//  iMediaProto
//
//  Created by Habib on 6/29/19.
//  Copyright © 2019 a. All rights reserved.
//

import UIKit

class popBase: UIViewController {
    
    @IBOutlet weak var btnSelect: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSelect.backgroundColor = .clear
        btnSelect.layer.cornerRadius = 5
        btnSelect.layer.borderWidth = 0.5
        btnSelect.layer.borderColor = UIColor.lightGray.cgColor
        
        let cn : String = Shared.shared.companyName ?? "Select Company"
        btnSelect.setTitle(cn,for: .normal)
        
        
        
}

}

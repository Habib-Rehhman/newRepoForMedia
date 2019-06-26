//
//  HomeViewController.swift
//  Snapchat Camera
//
//  Created by ashika shanthi on 2/17/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit
//import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var trouble: UILabel!
    @IBOutlet weak var signIn: UIButton!
    
    @IBOutlet weak var contactUs: UIButton!
    @IBOutlet weak var instructionBidy: UITextView!
    @IBOutlet weak var header: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderLanguage()
    }
    
    func renderLanguage(){
        
        if(LanguageViewController.buttonName ==  "ar" ||  LanguageViewController.buttonName ==  "fa-IR"){
            rightToLeftAlignment(Views: self.view.subviews)
        }
        
        signIn.setTitle("VerifyEmailSignInKey".localizableString(loc: LanguageViewController.buttonName), for: .normal)
        contactUs.setTitle("VerifyEmailContactUsKey".localizableString(loc: LanguageViewController.buttonName), for: .normal)
        
        trouble.text = "VerifyEmailHavingTroubleKey".localizableString(loc: LanguageViewController.buttonName)
        header.text = "VerifyEmailHeaderKey".localizableString(loc: LanguageViewController.buttonName)
        
        instructionBidy.text = "VerifyEmailInstructionKey".localizableString(loc: LanguageViewController.buttonName)
      
        
    }
    
}


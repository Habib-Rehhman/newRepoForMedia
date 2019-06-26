//
//  PasswordRecovery.swift
//  iMediaProto
//
//  Created by Habib on 6/24/19.
//  Copyright © 2019 a. All rights reserved.
//


import UIKit

class PasswordRecoverController: UIViewController {

    @IBOutlet weak var continueButtonOutlet: UIButton!
    @IBOutlet weak var recoveryHeader: UILabel!
    
    @IBOutlet weak var recoveryContactUs: UIButton!
    @IBOutlet weak var recoveryTrouble: UILabel!
    @IBOutlet weak var recoveryEmailField: UITextField!
    @IBOutlet weak var recoveryDescription: UITextView!
    
    @IBAction func continuePressed(_ sender: Any) {
        
        let alertController = UIAlertController(title: "RecoveryAlertControllerTitleKey".localizableString(loc: LanguageViewController.buttonName), message: "RecoveryAlertControllerKey".localizableString(loc: LanguageViewController.buttonName), preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: {_ in
            self.performSegue(withIdentifier: "loginScreen", sender: self)
        })
        
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    func renderLanguage(){
        
        if(LanguageViewController.buttonName ==  "ar" ||  LanguageViewController.buttonName ==  "fa-IR"){
            rightToLeftAlignment(Views: self.view.subviews)
        }
        continueButtonOutlet.setTitle("RecoveryContinueKey".localizableString(loc: LanguageViewController.buttonName), for: .normal)
        
        recoveryContactUs.setTitle("RecoveryContactUsKey".localizableString(loc: LanguageViewController.buttonName), for: .normal)
        recoveryHeader.text = "RecoveryHeaderKey".localizableString(loc: LanguageViewController.buttonName)
        recoveryDescription.text = "RecoveryInstructionKey".localizableString(loc: LanguageViewController.buttonName)
        recoveryTrouble.text = "RecoveryHavingTroubleKey".localizableString(loc: LanguageViewController.buttonName)
        recoveryEmailField.placeholder = "RecoveryEmailKey".localizableString(loc: LanguageViewController.buttonName)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        renderLanguage()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

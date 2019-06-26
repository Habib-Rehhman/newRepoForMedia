//
//  SignUpViewController.swift
//  Snapchat Camera
//
//  Created by ashika shanthi on 2/27/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit
//import Firebase

class SignUpViewController: UIViewController, UITextFieldDelegate {
    

    @IBOutlet weak var sihnIn: UIButton!
    @IBOutlet weak var signUp: UIButton!
    
    @IBOutlet weak var alreadyAccount: UILabel!
    //static var dataFromLanguageViewController = ""
    @IBOutlet weak var passwordConfirm: UITextField!
    // @IBOutlet weak var password: UITextField!
    @IBOutlet weak var header: UILabel!
    
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
   // @IBOutlet weak var fullName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        renderLanguage()
        
        email.delegate = self
        password.delegate = self
        passwordConfirm.delegate = self
    }
    func renderLanguage(){
            
        if(LanguageViewController.buttonName ==  "ar" || LanguageViewController.buttonName ==  "fa-IR"){
             rightToLeftAlignment(Views: self.view.subviews)
        }
     
        signUp.setTitle("SignUpButtonKey".localizableString(loc: LanguageViewController.buttonName), for: .normal)
        sihnIn.setTitle("SignUpInButtonKey".localizableString(loc: LanguageViewController.buttonName), for: .normal)
        
        alreadyAccount.text = "SignUpAlreadyAccountKey".localizableString(loc: LanguageViewController.buttonName)
        header.text = "SignUpHeaderKey".localizableString(loc: LanguageViewController.buttonName)
       
        fullName.placeholder = "SignUpFullNameKey".localizableString(loc: LanguageViewController.buttonName)
        email.placeholder = "SignUpEmailKey".localizableString(loc: LanguageViewController.buttonName)
        password.placeholder = "SignUpPasswordKey".localizableString(loc: LanguageViewController.buttonName)
        passwordConfirm.placeholder = "SignUpConfirmPaswordKey".localizableString(loc: LanguageViewController.buttonName)
        
    }
    @IBAction func signUpAction(_ sender: Any) {
        
        if password.text != passwordConfirm.text{
            let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{

        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }

}

extension String{
    
    func localizableString(loc: String) -> String {
    
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}

extension UIViewController{
    func rightToLeftAlignment(Views: [UIView]){
        //this for loop also acting as terminating base condition.
        for v in Views{
            if (v is UITextField){
                (v as! UITextField).textAlignment = NSTextAlignment.right
            }
            if (v is UITextView){
                (v as! UITextView).textAlignment = NSTextAlignment.right
            }
            rightToLeftAlignment(Views: v.subviews)
        }
    }
}

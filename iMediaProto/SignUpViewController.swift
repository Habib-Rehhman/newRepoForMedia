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
    var dataFromLanguageViewController = ""
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
    func recur(Views: [UIView]){
    
        if(Views.count == 0){

            return
        }
        if subview is UITextField
        {
            
            (subview as! UITextField).textAlignment = NSTextAlignment.right
        }
        
        
    }
    func renderLanguage(){
        
       // switch dataFromLanguageViewController{
            
        if(dataFromLanguageViewController ==  "ar" || dataFromLanguageViewController == "hi" || dataFromLanguageViewController ==  "fa-IR"){
            for subview in self.view.subviews
            {
                fullName.textAlignment = NSTextAlignment.right
                if subview is UITextField
                {
                    
                     (subview as! UITextField).textAlignment = NSTextAlignment.right
                }
            }
        }
     
           signUp.setTitle("SignUpButtonKey".localizableString(loc: dataFromLanguageViewController), for: .normal)
        sihnIn.setTitle("SignUpInButtonKey".localizableString(loc: dataFromLanguageViewController), for: .normal)
        
         alreadyAccount.text = "SignUpAlreadyAccountKey".localizableString(loc: dataFromLanguageViewController)
         header.text = "SignUpHeaderKey".localizableString(loc: dataFromLanguageViewController)
       
         fullName.placeholder = "SignUpFullNameKey".localizableString(loc: dataFromLanguageViewController)
          email.placeholder = "SignUpEmailKey".localizableString(loc: dataFromLanguageViewController)
          password.placeholder = "SignUpPasswordKey".localizableString(loc: dataFromLanguageViewController)
          passwordConfirm.placeholder = "SignUpConfirmPaswordKey".localizableString(loc: dataFromLanguageViewController)
        
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

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
    var gradient:CAGradientLayer?
    
    @IBOutlet weak var signUpButton: UIButton!

    var dataFromLanguageViewController = ""
    @IBOutlet weak var passwordConfirm: UITextField!
    // @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
   // @IBOutlet weak var fullName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
   /// @IBOutlet weak var passwordConfirm: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        renderLanguage()
        //addGradient()
        signUpButton.layer.cornerRadius = 10
        email.delegate = self
        password.delegate = self
        passwordConfirm.delegate = self
    }
    
    func renderLanguage(){
        
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
//            Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
//                if error == nil {
//                   self.performSegue(withIdentifier: "signupToHome", sender: self)
//                }
//                else{
//                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
//                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//
//                    alertController.addAction(defaultAction)
//                    self.present(alertController, animated: true, completion: nil)
//                }
//            }
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    func addGradient() {
        gradient = CAGradientLayer()
        let startColor = UIColor(red: 3/255, green: 196/255, blue: 190/255, alpha: 1)
        let endColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        gradient?.colors = [startColor.cgColor,endColor.cgColor]
        gradient?.startPoint = CGPoint(x: 0, y: 0)
        gradient?.endPoint = CGPoint(x: 0, y:1)
        gradient?.frame = view.frame
        self.view.layer.insertSublayer(gradient!, at: 0)
    }

}

extension String{
    
    func localizableString(loc: String) -> String {
    
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}

//
//  LoginViewController.swift
//  Snapchat Camera
//
//  Created by ashika shanthi on 2/27/18.
//  Copyright © 2018 ashika shanthi. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var loginCreateAccount: UIButton!
    @IBOutlet weak var logingForgot: UIButton!
    @IBOutlet weak var loginHeader: UILabel!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderLanguage()
        email.delegate = self
        password.delegate = self
    }

    
    func renderLanguage(){
        
        if(LanguageViewController.buttonName ==  "ar" || LanguageViewController.buttonName ==  "fa-IR"){
            rightToLeftAlignment(Views: self.view.subviews)
        }
        loginButton.setTitle("LoginSignInKey".localizableString(loc: LanguageViewController.buttonName), for: .normal)
        
        logingForgot.setTitle("LoginForgotKey".localizableString(loc: LanguageViewController.buttonName), for: .normal)
        loginCreateAccount.setTitle("LoginCreateAccountKey".localizableString(loc: LanguageViewController.buttonName), for: .normal)
        loginHeader.text = "LoginHeaderKey".localizableString(loc: LanguageViewController.buttonName)
        
        password.placeholder = "LoginPasswordKey".localizableString(loc: LanguageViewController.buttonName)
        email.placeholder = "LoginEmailKey".localizableString(loc: LanguageViewController.buttonName)
        
    }
    
    func showNetworkFailureAlert(){
        let alertController = UIAlertController(title: "NetworkAlertTitle".localizableString(loc: LanguageViewController.buttonName), message: "NetworkAlertMessage".localizableString(loc: LanguageViewController.buttonName), preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }
 
    @IBAction func signInPressed(_ sender: UIButton) {
      
      let sv = UIViewController.displaySpinner(onView: self.view)
       let url = URL(string: networkConstants.baseURL+networkConstants.login)!//"https://reqres.in/api/login")!

        let parameters:Parameters = [
                                     "app_id":"com.wikibolics.com",
                                     "appstore_id":"com.wikibolics.com",
                                     "session":"",
                                     "mac_id":"d4:61:9d:21:ea:f4",
                                     "email_address":email.text!,
                                     "password":password.text!]

       let header : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        
        AF.request(url, method:.post, parameters: parameters, encoding:URLEncoding.default, headers:header).responseJSON(completionHandler:{ response in
            UIViewController.removeSpinner(spinner: sv)
            switch response.result {
                
            case .success(let json):
                print(json)
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: json)
                    let decoder = JSONDecoder()
                    let gitData = try decoder.decode(signinStructure.self, from: jsonData)
                    if(gitData.message != "login_success"){
                        
                        print("login unsuccessful reason:\(gitData.message)")
                        
                    }else{
                        print(gitData.loginName!)
                    }
                    
                } catch let err {
                   print(err.localizedDescription)
                }
                break
                
            case .failure:
                self.showNetworkFailureAlert()
                break
            }
        })
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
}

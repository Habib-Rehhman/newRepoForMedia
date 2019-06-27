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
    
    

    @IBAction func signInPressed(_ sender: UIButton) {
//
       let url = URL(string: "https://reqres.in/api/login")! //"http://192.168.1.122/wikibolics/login.php")!
//
//
        let parameters:Parameters = [//"appstore_id":"com.wikibolics.com",
                                     //"app_id":"com.wikibolics.com",
                                     //"mac_id":"d4:61:9d:21:ea:f4",
                                     "email":"eve.holt@reqres.in",//"abc@gmail.com",
                                     "password":"cityslicka"]//"12345678"]
//
//       // print("URL:",url)
//       // print(parameters)
//
       let header : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        
        
        AF.request(url, method:.post, parameters: parameters, encoding:URLEncoding.default, headers:header).responseJSON(completionHandler:{ response in
            switch response.result {
                
            case .success(let json):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: json)
                    let decoder = JSONDecoder()
                    let gitData = try decoder.decode(ResponseSuccessful.self, from: jsonData)
                    print(gitData.token!)
                    
                } catch let err {
                    print("Err", err)
                }
                break
                
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
        })
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
}

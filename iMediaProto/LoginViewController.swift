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
        //        let sv = UIViewController.displaySpinner(onView: self.view)
        //        let url = URL(string: networkConstants.baseURL+networkConstants.login)!//"https://reqres.in/api/login")!
        //
        //        let parameters:Parameters = [
        //            "app_id":"com.wikibolics.com",
        //            "appstore_id":"com.wikibolics.com",
        //            "session":"",
        //            "mac_id":"d4:61:9d:21:ea:f4",
        //            "email_address":email.text!,
        //            "password":password.text!]
        //
        //        let header : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        //
        //        AF.request(url, method:.post, parameters: parameters, encoding:URLEncoding.default, headers:header).responseJSON(completionHandler:{ response in
        //            switch response.result {
        //
        //            case .success(let json):
        //                print(json)
        //                do {
        //                    let jsonData = try JSONSerialization.data(withJSONObject: json)
        //                    let decoder = JSONDecoder()
        //                    let gitData = try decoder.decode(signinStructure.self, from: jsonData)
        //                    if(gitData.message != "login_success"){
        //
        //                        UIViewController.removeSpinner(spinner: sv)
        //                        self.showWrongCredentialsAlert()
        //                        print("login unsuccessful reason:\(gitData.message)")
        //
        //                    }else{
        //
        //                        let urlChapter = URL(string: networkConstants.baseURL+networkConstants.nextToLogin)!//"https://reqres.in/api/login")!
        //
        //                        let parametersChapter:Parameters = [
        //                            "app_id":"com.wikibolics.com",
        //                            "appstore_id":"com.wikibolics.com",
        //                            "session":"\(gitData.loginSession!)@d4:61:9d:21:ea:f4"
        //                        ]
        //
        //                        AF.request(urlChapter, method:.post, parameters: parametersChapter, encoding:URLEncoding.default, headers:header).responseJSON(completionHandler:{ response in
        //                            print("\(gitData.loginSession!)@d4:61:9d:21:ea:f4")
        //                            switch response.result {
        //
        //                            case .success(let json):
        //                                print(json)
        //                                do {
        //                                    let jsonData = try JSONSerialization.data(withJSONObject: json)
        //                                    let decoder = JSONDecoder()
        //                                    let gitData = try decoder.decode(arrayOfChapters.self, from: jsonData)
        //                                    if(gitData.message != nil){
        //                                        UIViewController.removeSpinner(spinner: sv)
        //                                        self.showNetworkFailureAlert()
        //                                    }else{
        //                                         UIViewController.removeSpinner(spinner: sv)
        //                                                        self.performSegue(withIdentifier: "showChaptersNow", sender: self)
        //                                        gitData.chaptersList!.forEach({ (chapter) in
        //                                            print(chapter.name)
        //                                            QuoteDeck.sharedInstance.quotes.append( Quote(text: chapter.name,tags: [chapter.part]))
        //                                        })
        //
        //                                        QuoteDeck.sharedInstance.update()
        //
        //
        //                                    }
        //
        //                                } catch let err {
        //                                    print("Err", err)
        //                                }
        //                                break
        //
        //                            case .failure(let error):
        //                                UIViewController.removeSpinner(spinner: sv)
        //                                self.showNetworkFailureAlert()
        //                                print(error.localizedDescription)
        //                                break
        //                            }
        //
        //                        })
        //                    }
        //
        //                } catch let err {
        //                    print(err.localizedDescription)
        //                }
        //                break
        //
        //            case .failure:
        //                self.showNetworkFailureAlert()
        //                break
        //            }
        //        })
        //
        //
        self.performSegue(withIdentifier: "showChaptersNow", sender: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
}

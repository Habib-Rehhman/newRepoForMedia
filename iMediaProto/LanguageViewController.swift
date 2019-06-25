

import UIKit

class LanguageViewController: UIViewController {


    static var buttonName = ""
    override func viewDidLoad() {
       
        super.viewDidLoad()
    }
    
    @IBAction func langButtonPressed(_ sender: UIButton) {
        
        switch sender.tag{
            
        case 1:
            LanguageViewController.buttonName = "ar"
            performSegue(withIdentifier: "languageSelected", sender: self)
            break
        case 3:
            LanguageViewController.buttonName = "hi"
            performSegue(withIdentifier: "languageSelected", sender: self)
            break
        case 4:
            LanguageViewController.buttonName = "es"
           performSegue(withIdentifier: "languageSelected", sender: self)
            break
        case 5:
            LanguageViewController.buttonName = "de"
            performSegue(withIdentifier: "languageSelected", sender: self)
            break
        case 6:
            LanguageViewController.buttonName = "ru"
           performSegue(withIdentifier: "languageSelected", sender: self)
            break
        case 7:
            LanguageViewController.buttonName = "zh-Hans"
            performSegue(withIdentifier: "languageSelected", sender: self)
            break
        case 8:
            LanguageViewController.buttonName = "fa-IR"
            performSegue(withIdentifier: "languageSelected", sender: self)
            break
        case 9:
            LanguageViewController.buttonName = "tr"
            performSegue(withIdentifier: "languageSelected", sender: self)
            break
        default:
            LanguageViewController.buttonName = "en"
            performSegue(withIdentifier: "languageSelected", sender: self)
        }
    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

}

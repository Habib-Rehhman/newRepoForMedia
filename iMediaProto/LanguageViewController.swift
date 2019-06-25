

import UIKit

class LanguageViewController: UIViewController {


    var buttonName = ""
    override func viewDidLoad() {
       
        super.viewDidLoad()
       //  UIView.appearance().semanticContentAttribute = .forceRightToLeft
    }
    
    @IBAction func langButtonPressed(_ sender: UIButton) {
        
        switch sender.tag{
            
        case 1:
            buttonName = "ar"
            performSegue(withIdentifier: "languageSelected", sender: self)
            break
        case 3:
            buttonName = "hi"
            performSegue(withIdentifier: "languageSelected", sender: self)
            break
        case 4:
            buttonName = "es"
            performSegue(withIdentifier: "languageSelected", sender: self)
            break
        case 5:
            buttonName = "de"
            performSegue(withIdentifier: "languageSelected", sender: self)
            break
        case 6:
            buttonName = "ru"
            performSegue(withIdentifier: "languageSelected", sender: self)
            break
        case 7:
            buttonName = "zh-Hans"
            performSegue(withIdentifier: "languageSelected", sender: self)
            break
        case 8:
            buttonName = "fa-IR"
            performSegue(withIdentifier: "languageSelected", sender: self)
            break
        case 9:
            buttonName = "tr"
            performSegue(withIdentifier: "languageSelected", sender: self)
            break
        default:
            buttonName = "en"
            performSegue(withIdentifier: "languageSelected", sender: self)
        }
    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "languageSelected"{
            
            let signUpVC = segue.destination as! SignUpViewController
            
            signUpVC.dataFromLanguageViewController = buttonName
    }

}
}

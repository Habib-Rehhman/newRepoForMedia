

import UIKit

class LanguageViewController: UIViewController {

//    @IBOutlet weak var collectionView: UICollectionView!
//
//    var estimateWidth = 80.0
//    var cellMarginSize = 10.0
    var buttonName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //rather then making function for each button, use tags within one function
    @IBAction func arabicButton(_ sender: UIButton) {
        
        buttonName = "ar"
        performSegue(withIdentifier: "languageSelected", sender: self)
        
    }
    @IBAction func englishButton(_ sender: UIButton) {
        
        buttonName = "en"
        performSegue(withIdentifier: "languageSelected", sender: self)
        
    }
//    @IBAction func showNextPage(_ sender: Any) {
//        print("hiiiii")
//       // self.performSegue(withIdentifier: "langSelected", sender: nil)
//    }
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

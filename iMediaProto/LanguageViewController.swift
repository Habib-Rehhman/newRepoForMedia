

import UIKit

class LanguageViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var estimateWidth = 80.0
    var cellMarginSize = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showNextPage(_ sender: Any) {
        print("hiiiii")
       // self.performSegue(withIdentifier: "langSelected", sender: nil)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }

}

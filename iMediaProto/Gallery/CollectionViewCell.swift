

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
 //   @IBOutlet var titleLabel: UILabel!

    private let noImage = UIImage(named: "NoImage")
    
    func setErrorImageIfNeeded(error: NSError?) {
        if error != nil { imageView.image = noImage }
    }
}

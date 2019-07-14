
import UIKit

class ZoomedPhotoViewController: UIViewController {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
  @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
  @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
  @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
  open var photoIndex: Int!
  var photoName: String?
  
  override func viewDidLoad() {
   // if let photoName = photoName {
      imageView.image = ImagesVC.picz[photoIndex]//UIImage(named: photoName)
    //}
  }
  
  fileprivate func updateMinZoomScaleForSize(_ size: CGSize) {
    let widthScale = size.width / imageView.bounds.width
    let heightScale = size.height / imageView.bounds.height
    let minScale = min(widthScale, heightScale)
    
    scrollView.minimumZoomScale = minScale
    
    scrollView.zoomScale = minScale
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    updateMinZoomScaleForSize(view.bounds.size)
    centerImageViewToSuperView()
  }
    fileprivate func centerImageViewToSuperView() {
        var zoomFrame = imageView.frame
        
        if(zoomFrame.size.width < scrollView.bounds.size.width) {
            zoomFrame.origin.x = (scrollView.bounds.size.width - zoomFrame.size.width) / 2.0
            
        } else {
            zoomFrame.origin.x = 0.0
            
        }
        
        if(zoomFrame.size.height < scrollView.bounds.size.height) {
            zoomFrame.origin.y = (scrollView.bounds.size.height - zoomFrame.size.height) / 2.0
            
        } else {
            zoomFrame.origin.y = 0.0
            
        }
        
        imageView.frame = zoomFrame
        
    }

  fileprivate func updateConstraintsForSize(_ size: CGSize) {
    
    let yOffset = max(0, (size.height - imageView.frame.height) / 2)
    imageViewTopConstraint.constant = yOffset
    imageViewBottomConstraint.constant = yOffset
    
    let xOffset = max(0, (size.width - imageView.frame.width) / 2)
    imageViewLeadingConstraint.constant = xOffset
    imageViewTrailingConstraint.constant = xOffset
    
    view.layoutIfNeeded()
  }
  
}

extension ZoomedPhotoViewController: UIScrollViewDelegate {
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return imageView
  }
  
  func scrollViewDidZoom(_ scrollView: UIScrollView) {
    updateConstraintsForSize(view.bounds.size)
  }
  
}

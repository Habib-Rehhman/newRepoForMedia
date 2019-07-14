

import UIKit

open class PhotoCommentViewController: UIViewController {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var nameTextField: UITextField!
  open var photoName: String?
  open var photoIndex: Int!
	
  override open func viewDidLoad() {
    super.viewDidLoad()
   // if let photoName = photoName {
      self.imageView.image = ImagesVC.picz[photoIndex]//UIImage(named: photoName)
    //}
		
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(PhotoCommentViewController.keyboardWillShow(_:)),
                                           name: UIResponder.keyboardWillShowNotification,
                                           object: nil)
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(PhotoCommentViewController.keyboardWillHide(_:)),
                                           name: UIResponder.keyboardWillHideNotification,
                                           object: nil)
  }
	
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
	
  func adjustInsetForKeyboardShow(_ show: Bool, notification: Notification) {
    let userInfo = notification.userInfo ?? [:]
    let keyboardFrame = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
    let adjustmentHeight = (keyboardFrame.height + 20) * (show ? 1 : -1)
    scrollView.contentInset.bottom += adjustmentHeight
    scrollView.scrollIndicatorInsets.bottom += adjustmentHeight
  }
	
  @objc func keyboardWillShow(_ notification: Notification) {
    adjustInsetForKeyboardShow(true, notification: notification)
  }
	
  @objc func keyboardWillHide(_ notification: Notification) {
    adjustInsetForKeyboardShow(false, notification: notification)
  }
	
  @IBAction func hideKeyboard(_ sender: AnyObject) {
    nameTextField.endEditing(true)
  }
	
  @IBAction func openZoomingController(_ sender: AnyObject) {
    self.performSegue(withIdentifier: "zooming", sender: nil)
  }
	
  override open func prepare(for segue: UIStoryboardSegue,
                             sender: Any?) {
    if let id = segue.identifier,
      let zoomedPhotoViewController = segue.destination as? ZoomedPhotoViewController,
      id == "zooming" {
      zoomedPhotoViewController.photoIndex = photoIndex
    }
  }
}




import UIKit

class ManagePageViewController: UIPageViewController {
  //var photos = ["photo1", "photo2", "photo3", "photo4", "photo5"]
  var currentIndex: Int!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dataSource = self
    
    // 1
    if let viewController = viewPhotoCommentController(currentIndex ){//?? 0) {
      let viewControllers = [viewController]
      // 2
      setViewControllers(viewControllers,
                         direction: .forward,
                         animated: false,
                         completion: nil)
    }
  }
  
  func viewPhotoCommentController(_ index: Int) -> PhotoCommentViewController? {
    if let storyboard = storyboard,
      let page = storyboard.instantiateViewController(withIdentifier: "PhotoCommentViewController") as? PhotoCommentViewController {
     // page.photoName = ImagesVC.newStruct[index]
      page.photoIndex = index
      return page
    }
    return nil
  }
}

//MARK: implementation of UIPageViewControllerDataSource
extension ManagePageViewController: UIPageViewControllerDataSource {
  // 1
  func pageViewController(_ pageViewController: UIPageViewController,
                          viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
    if let viewController = viewController as? PhotoCommentViewController,
      let index = viewController.photoIndex,
      index > 0 {
      return viewPhotoCommentController(index - 1)
    }
    
    return nil
  }
  
  // 2
  func pageViewController(_ pageViewController: UIPageViewController,
                          viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
    if let viewController = viewController as? PhotoCommentViewController,
      let index = viewController.photoIndex,
      (index + 1) < ImagesVC.newStruct.count {
      return viewPhotoCommentController(index + 1)
    }
    
    return nil
  }
  
  // MARK: UIPageControl
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return ImagesVC.newStruct.count
  }
  
  func presentationIndex(for pageViewController: UIPageViewController) -> Int {
    return currentIndex ?? 0
  }
}


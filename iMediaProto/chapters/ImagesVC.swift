////
////  ImagesVC.swift
////  iMediaProto
////
////  Created by Habib on 7/3/19.
////  Copyright © 2019 a. All rights reserved.
////
//
//import UIKit
//import Kingfisher
//
//class ImagesVC: UIViewController{
//
//    @IBOutlet var collectionView: UICollectionView!
//    var pictures = [CollieGalleryPicture]()
//    var numberOfItemsPerRow: CGFloat = 3.0
//    static var newStruct: [imagesStruct] = []
//
//
//    var options = CollieGalleryOptions()
//    private let placeholderImage = UIImage(named: "NowLoading")
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        options.enableSave = false
//
//        let screenSize = UIScreen.main.bounds
//        let screenWidth = screenSize.width
//        _ = screenSize.height
//
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
//        layout.itemSize = CGSize(width: screenWidth / 3, height: screenWidth / 3)
//        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
//        collectionView!.dataSource = self
//        collectionView!.delegate = self
//        collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
//        collectionView!.backgroundColor = UIColor.green
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
//        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 0
//       collectionView!.collectionViewLayout = layout
//    }
//
//
//}
//
//extension ImagesVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return ImagesVC.newStruct.count
//    }
//
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
//    {
//        super.viewWillTransition(to: size, with: coordinator)
//        let offset = self.collectionView?.contentOffset;
//        let width  = self.collectionView?.bounds.size.width;
//
//        let index     = round(offset!.x / width!);
//        let newOffset = CGPoint(x: index * size.width, y: offset!.y)
//
//        self.collectionView?.setContentOffset(newOffset, animated: false)
//
//
//        coordinator.animate(alongsideTransition: { (context) in
//            self.collectionView?.reloadData()
//            self.collectionView?.setContentOffset(newOffset, animated: false)
//        }, completion: nil)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        options.openAtIndex = indexPath.row
//        options.enableInteractiveDismiss = false
//       let gallery = CollieGallery(pictures: pictures, options: options)
//        gallery.presentInViewController(self)
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let leftAndRightPaddings: CGFloat = 60.0
//
//        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
//        return CGSize(width: width, height: width)
//    }
//
//    override func viewWillDisappear(_ animated: Bool) {
//         super.viewWillDisappear(animated)
//        print("called Disappear")
//        for i in 0 ..< pictures.count{
//            pictures[i].labTest = UIImageView()
//            pictures[i].labTest!.kf.indicatorType = .activity
//            pictures[i].labTest!.kf.setImage(with: URL(string: ImagesVC.newStruct[i].labTesting!))
////            {
////                result in
////                switch result {
////                case .success(let value):
////                    //lab: ImagesVC.newStruct[indexPath.row].labTesting)
////                    //fake: ImagesVC.newStruct[indexPath.row].fakeOriginal
////                    let picture = CollieGalleryPicture(image: value.image,fake: nil,lab: nil)
////                    self.pictures.append(picture)
////                    break
////                case .failure(let error):
////                    cell.setErrorImageIfNeeded(error: error)
////                    let pic = CollieGalleryPicture(image: UIImage(named: "NoImage")!,fake: nil,lab: nil)
////                    self.pictures.append(pic)
////                }
////            }
//        }
//    }
//
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        if (UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft || UIDevice.current.orientation == UIDeviceOrientation.landscapeRight) {
//            numberOfItemsPerRow = 6.0
//        } else {
//            numberOfItemsPerRow = 3.0
//        }
//
//        collectionView!.collectionViewLayout.invalidateLayout()
//    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
//
//        let processor = BlurImageProcessor(blurRadius: 0) // Blur with a radius
////        cell.imageView.kf.setImage(with: ImagesVC.newStruct[indexPath.row].image, placeholder: placeholderImage, options: [.transition(.fade(5.0)), .processor(processor)], progressBlock: nil, completionHandler: { (image, error, cachType, url) in
////            if(image != nil){
////                let picture = CollieGalleryPicture(image: image!,fake: ImagesVC.newStruct[indexPath.row].fakeOriginal,lab: ImagesVC.newStruct[indexPath.row].labTesting)
////                self.pictures.append(picture)
////            }else{
////                cell.setErrorImageIfNeeded(error: error)
////                let pic = CollieGalleryPicture(image: UIImage(named: "NoImage")!)
////                self.pictures.append(pic)
////            }
////
////        })
//
////        cell.imageView.kf.indicatorType = .activity
//        cell.imageView.kf.setImage(
//            with: ImagesVC.newStruct[indexPath.row].image,
//            placeholder: placeholderImage,
//            options:[.transition(.fade(5.0)), .processor(processor)])
//        {
//            result in
//            switch result {
//            case .success(let value):
//                //lab: ImagesVC.newStruct[indexPath.row].labTesting)
//                //fake: ImagesVC.newStruct[indexPath.row].fakeOriginal
//                let picture = CollieGalleryPicture(image: value.image,fake: nil,lab: nil)
//                    self.pictures.append(picture)
//                break
//            case .failure(let error):
//                cell.setErrorImageIfNeeded(error: error)
//                let pic = CollieGalleryPicture(image: UIImage(named: "NoImage")!,fake: nil,lab: nil)
//                self.pictures.append(pic)
//            }
//        }
//        return cell
//    }
//}
//



import UIKit
import Kingfisher

class ImagesVC: UICollectionViewController {
    
    static var picz: [UIImage] = []
    static var newStruct: [imagesStruct] = []
    
    fileprivate let reuseIdentifier = "PhotoCell"
    fileprivate let thumbnailSize = CGSize(width: 70.0, height: 70.0)
    fileprivate let sectionInsets = UIEdgeInsets(top: 10, left: 5.0, bottom: 10.0, right: 5.0)
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell,
            let indexPath = collectionView?.indexPath(for: cell),
            let managePageViewController = segue.destination as? ManagePageViewController {
            // managePageViewController.photos = photos
            managePageViewController.currentIndex = indexPath.row
        }
    }
}

// MARK: UICollectionViewDataSource
extension ImagesVC {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImagesVC.newStruct.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCell
        
                let processor = BlurImageProcessor(blurRadius: 0)
                let placeholderImage = UIImage(named: "NowLoading")
        
        cell.imageView.kf.setImage(
                        with: ImagesVC.newStruct[indexPath.row].image,
                        placeholder: placeholderImage,
                        options:[.transition(.fade(5.0)), .processor(processor)])
                    {
                        result in
                        switch result {
                       case .success(let value):
                        ImagesVC.picz.append(value.image)
//                        let fullSizedImage = value.image
//                        cell.imageView.image = fullSizedImage.thumbnailOfSize(self.thumbnailSize)

                        
                            break
                        case .failure(let error):
                            cell.setErrorImageIfNeeded(error: error)
                  
                        }
                    }


        
        return cell
    }
}

// MARK:UICollectionViewDelegateFlowLayout
extension ImagesVC : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return thumbnailSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
}

//
//  ImagesVC.swift
//  iMediaProto
//
//  Created by Habib on 7/3/19.
//  Copyright © 2019 a. All rights reserved.
//

import UIKit
import Kingfisher

class ImagesVC: UIViewController{
    
    @IBOutlet var collectionView: UICollectionView!
    var pictures = [CollieGalleryPicture]()
    var numberOfItemsPerRow: CGFloat = 3.0
    static var jsonURLs: [URL] = []
    static var newStruct: [imagesStruct] = []
//        URL(string: "https://pixel.nymag.com/imgs/daily/science/2016/05/20/20-emily-ratajkowski.w710.h473.2x.jpg"),
//        URL(string: "https://www.bpsalon.com/wp-content/uploads/2017/10/beauty-salon-89790-900.jpg"),
//        URL(string: "https://cdn.images.express.co.uk/img/dynamic/130/590x/beautiful-people-elite-dating-website-545400.jpg"),
//        URL(string: "https://viola.bz/wp-content/uploads/2012/04/Beautiful-People-1.jpg"),
//        URL(string: "https://images.all-free-download.com/images/graphiclarge/beautiful_evening_pier_picture_165879.jpg"),
//        URL(string: "https://mandeephooda.files.wordpress.com/2013/07/2048.jpg"),
        
    
    var options = CollieGalleryOptions()
    private let placeholderImage = UIImage(named: "NowLoading")
    override func viewDidLoad() {
        super.viewDidLoad()
        options.enableSave = false
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        _ = screenSize.height
        
        // Do any additional setup after loading the view, typically from a nib
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth / 3, height: screenWidth / 3)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView!.backgroundColor = UIColor.green
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
       collectionView!.collectionViewLayout = layout
    }
    

}

extension ImagesVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImagesVC.jsonURLs.count
        //return ImagesVC.newStruct.count
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        super.viewWillTransition(to: size, with: coordinator)
        let offset = self.collectionView?.contentOffset;
        let width  = self.collectionView?.bounds.size.width;
        
        let index     = round(offset!.x / width!);
        let newOffset = CGPoint(x: index * size.width, y: offset!.y)
        
        self.collectionView?.setContentOffset(newOffset, animated: false)
        
        
        coordinator.animate(alongsideTransition: { (context) in
            self.collectionView?.reloadData()
            self.collectionView?.setContentOffset(newOffset, animated: false)
        }, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        options.openAtIndex = indexPath.row
       let gallery = CollieGallery(pictures: pictures, options: options)
        gallery.actionButton = UIButton(type: .roundedRect)
        gallery.presentInViewController(self)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let leftAndRightPaddings: CGFloat = 60.0
        
        let width = (collectionView.frame.width-leftAndRightPaddings)/numberOfItemsPerRow
        return CGSize(width: width, height: width)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if (UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft || UIDevice.current.orientation == UIDeviceOrientation.landscapeRight) {
            numberOfItemsPerRow = 6.0
        } else {
            numberOfItemsPerRow = 3.0
        }
        
        collectionView!.collectionViewLayout.invalidateLayout()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        let processor = BlurImageProcessor(blurRadius: 0) // Blur with a radius
        cell.imageView.kf.setImage(with: ImagesVC.jsonURLs[indexPath.row], placeholder: placeholderImage, options: [.transition(.fade(5.0)), .processor(processor)], progressBlock: nil, completionHandler: { (image, error, cachType, url) in
            if(image != nil){
                let picture = CollieGalleryPicture(image: image!)
                self.pictures.append(picture)
            }else{
                cell.setErrorImageIfNeeded(error: error)
                let pic = CollieGalleryPicture(image: UIImage(named: "NoImage")!)
                self.pictures.append(pic)
            }
            
        })
        
        return cell
    }
}


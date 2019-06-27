//
//  Extensions.swift
//  iMediaProto
//
//  Created by Habib on 6/27/19.
//  Copyright © 2019 a. All rights reserved.
//
import UIKit

extension String{
    
    func localizableString(loc: String) -> String {
        
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")!
        let bundle = Bundle(path: path)!
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}

extension UIViewController{
    func rightToLeftAlignment(Views: [UIView]){
        //this for loop also acting as terminating base condition.
        for v in Views{
            if (v is UITextField){
                (v as! UITextField).textAlignment = NSTextAlignment.right
            }
            if (v is UITextView){
                (v as! UITextView).textAlignment = NSTextAlignment.right
            }
            rightToLeftAlignment(Views: v.subviews)
        }
    }
    
    
    
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.color = .black
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}


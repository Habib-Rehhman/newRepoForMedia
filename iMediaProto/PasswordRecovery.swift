//
//  PasswordRecovery.swift
//  iMediaProto
//
//  Created by Habib on 6/24/19.
//  Copyright © 2019 a. All rights reserved.
//


import UIKit

class PasswordRecoverController: UIViewController {

    

    @IBAction func continuePressed(_ sender: Any) {
        
        let alertController = UIAlertController(title: NSLocalizedString("alertControllerKey", comment: "Title for Alert Sheet"), message: "A link has been sent to this email. Go to your email and follow the instructions", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: {_ in
            self.performSegue(withIdentifier: "loginScreen", sender: self)
        })
        
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

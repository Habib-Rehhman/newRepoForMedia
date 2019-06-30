//
//  lessonsViewController.swift
//  iMediaProto
//
//  Created by Habib on 6/30/19.
//  Copyright © 2019 a. All rights reserved.
//


import UIKit
import Alamofire

class lesonsViewController : UITableViewController, UIDataSourceModelAssociation {
    
    fileprivate lazy var presentationAnimator = GuillotineTransitionAnimation()
    @IBOutlet fileprivate var barButton: UIBarButtonItem!
    // MARK: - Constants
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    private var index = -1;
    static var lessons: [lesson] = []
    private struct Storyboard {
        static let TopicCellIdentifier = "TopicCell"
        static let ShowQuoteSegueIdentifier = "ShowQuote"
    }
    
    @IBAction func showMenuAction(_ sender: UIBarButtonItem) {
        
        let menuViewController = storyboard!.instantiateViewController(withIdentifier: "MenuViewController")
        menuViewController.modalPresentationStyle = .custom
        menuViewController.transitioningDelegate = self
        
        presentationAnimator.animationDelegate = menuViewController as? GuillotineAnimationDelegate
        presentationAnimator.supportView = navigationController!.navigationBar
        //presentationAnimator.presentButton = sender
        present(menuViewController, animated: true, completion: nil)
    }
    var selectedTopic: String?
    
    // MARK: - View controller lifecycle
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? QuoteViewController {
            destinationVC.topic = selectedTopic
        }
    }
    
    
    func indexPathForElement(withModelIdentifier identifier: String, in view: UIView) -> IndexPath? {
       // let row = lesonsViewController.lessons.//firstIndex(of: identifier) ?? 0
        index += 1
        return IndexPath(row: index, section: 0)
    }
    
    func modelIdentifierForElement(at idx: IndexPath, in view: UIView) -> String? {
        return lesonsViewController.lessons[idx.row].name
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lesonsViewController.lessons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lessonCell")!
        
        cell.textLabel?.text = lesonsViewController.lessons[indexPath.row].name
        
        tableView.backgroundColor = UIColor(hexString: "#A5DEFF")//.gray
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = CGFloat(12)
        cell.layer.borderColor = tableView.backgroundColor?.cgColor
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        selectedTopic = QuoteDeck.sharedInstance.tagSet[indexPath.row]
//
//        let urlChapter = URL(string: networkConstants.baseURL+networkConstants.lessons)!//"https://reqres.in/api/login")!
//        let header : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
//        let parametersChapter:Parameters = [
//            "app_id":"com.wikibolics.com",
//            "appstore_id":"com.wikibolics.com",
//            "chapter": "\(indexPath.row+1)",
//            "session":"1@03bed5d5798bb277d9f6884ba6a6c784@EC:8C:9A:F3:55:4F"
//        ]
//        let sv = UIViewController.displaySpinner(onView: self.view)
//        AF.request(urlChapter, method:.post, parameters: parametersChapter, encoding:URLEncoding.default, headers:header).responseJSON(completionHandler:{ response in
//            switch response.result {
//
//            case .success(let json):
//                print(json)
//                do {
//                    let jsonData = try JSONSerialization.data(withJSONObject: json)
//                    let decoder = JSONDecoder()
//                    let gitData = try decoder.decode(arrayOfLessons.self, from: jsonData)
//                    if(gitData.message != nil){
//                        UIViewController.removeSpinner(spinner: sv)
//                        switch gitData.message!{
//
//                        case "lessons_list_empty":
//                            print("this lesson contains nothing")
//                            self.showOkAlert(tit: "EmptyLessonsListTitle", msg: "EmptyLessonsListMessage")
//
//                            break
//                        default:
//                            print("this is default")
//                        }
//
//                    }else{
//
//                        UIViewController.removeSpinner(spinner: sv)
//                        gitData.lessonsList!.forEach({ (lesn) in
//                          print("nothind")
//                        })
//                       //  self.performSegue(withIdentifier:"showLessons", sender: nil)
//                        //  QuoteDeck.sharedInstance.quotes[indexPath.row].text =
//                    }
//
//                } catch let err {
//                    print("Err", err)
//                }
//                break
//
//            case .failure(let error):
//                UIViewController.removeSpinner(spinner: sv)
//                self.showOkAlert(tit: "NetworkAlertTitle", msg: "NetworkAlertMessage")
//                print(error.localizedDescription)
//                break
//            }
//
//        })
//
//
        self.performSegue(withIdentifier:"showMainText", sender: nil)
    }
}

extension lesonsViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentationAnimator.mode = .presentation
        return presentationAnimator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        presentationAnimator.mode = .dismissal
        return presentationAnimator
    }
}


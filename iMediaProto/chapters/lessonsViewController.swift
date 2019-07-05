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
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if let destinationVC = segue.destination as? QuoteViewController {
    //            destinationVC.topic = selectedTopic
    //        }
    //    }
    
    
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
//        tableView.backgroundColor = UIColor(hexString: "#A5DEFF")
//        return lesonsViewController.lessons.count
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lessonCell")!
        
        cell.textLabel?.text = "hiiiii" //lesonsViewController.lessons[indexPath.row].name
        
        //.gray
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = CGFloat(12)
        cell.layer.borderColor = tableView.backgroundColor?.cgColor
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        print("lessonObject:  \(lesonsViewController.lessons[indexPath.row+1])\n size: \(lesonsViewController.lessons.count)")
//        SubLessonsVC.sublessons.removeAll()
//        // selectedTopic = QuoteDeck.sharedInstance.tagSet[indexPath.row]
//
//        let urlChapter = URL(string: networkConstants.baseURL+networkConstants.sublessons)!//"https://reqres.in/api/login")!
//        let header : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
//        let parametersChapter:Parameters = [
//            "app_id":"com.wikibolics.com",
//            "appstore_id":"com.wikibolics.com",
//            "lesson": "\(lesonsViewController.lessons[indexPath.row+1].id)",
//            "sub_lesson": "\(lesonsViewController.lessons[indexPath.row+1].subLessons)",
//            "session":networkConstants.session
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
//                    let gitData = try decoder.decode(arrayOfSubLessons.self, from: jsonData)
//                    if(gitData.message != nil){
//                        UIViewController.removeSpinner(spinner: sv)
//                        switch gitData.message!{
//
//                        case "lessons_list_empty":
//                            print("this sublesson contain")
//                            self.showOkAlert(tit: "EmptyLessonsListTitle", msg: "EmptyLessonsListMessage")
//
//                            break
//                        default:
//                            // self.showOkAlert(tit: "EmptyLessonsListTitle", msg: "EmptyLessonsListMessage")
//                            print("no point in making this request")
//                        }
//
//                    }else{
//
//                        UIViewController.removeSpinner(spinner: sv)
//                        gitData.sublessonsList!.forEach({ (lesn) in
//                            SubLessonsVC.sublessons.append(lesn)
//                        })
//                        self.performSegue(withIdentifier:"showSubLessons", sender: nil)
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

           self.performSegue(withIdentifier:"showSubLessons", sender: nil)
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


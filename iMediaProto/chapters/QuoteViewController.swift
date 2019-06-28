//
//  QuoteViewController.swift
//  Founding Fathers Quote Book
//
//  Created by Steve Liddle on 9/7/16.
//  Copyright © 2016 Steve Liddle. All rights reserved.
//

import UIKit

class QuoteViewController : UIViewController {
    
    // MARK: - Constants
    
    private struct Key {
        static let CurrentQuoteIndex = "CurrentQuoteIndex"
        static let Topic = "Topic"
    }
    
    private struct Storyboard {
        static let QuoteOfTheDayTitle = ""
        static let ShowTopicsSegueIdentifier = "ShowTopics"
       // static let TodayTitle = "Today"
        static let TopicsTitle = "Topics"
    }

    // MARK: - Outlets
    
    @IBOutlet weak var toggleButton: UIBarButtonItem!
   // @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var textView: UITextView!
    // MARK: - Properties
    
    var currentQuoteIndex = 0
    var topic: String?
    var quotes: [Quote]!
    
    // MARK: - View controller lifecycle
    
    override func viewDidLoad() {
        print("viewDidLoad")
        super.viewDidLoad()

        configure(updatingCurrentIndex: true)
        performSegue(withIdentifier: Storyboard.ShowTopicsSegueIdentifier, sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if AppDelegate.shared.wantsToDisplayQuoteOfTheDay {
            AppDelegate.shared.wantsToDisplayQuoteOfTheDay = false
            topic = nil
            configure(updatingCurrentIndex: true)
        }
    }

    // MARK: - State restoration
    
    override func decodeRestorableState(with coder: NSCoder) {
        print("decodeRestorableState")
        super.decodeRestorableState(with: coder)
        
        currentQuoteIndex = coder.decodeInteger(forKey: Key.CurrentQuoteIndex)
        
        if let savedTopic = coder.decodeObject(forKey: Key.Topic) as? String {
            topic = savedTopic
        }

        configure(updatingCurrentIndex: false)
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        
        coder.encode(currentQuoteIndex, forKey: Key.CurrentQuoteIndex)
        coder.encode(topic, forKey: Key.Topic)
    }

    // MARK: - Actions
    
    @IBAction func showQuoteOfTheDay() {
        topic = nil
        configure(updatingCurrentIndex: true)
    }

    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            currentQuoteIndex -= 1
            
            if currentQuoteIndex < 0 {
                currentQuoteIndex = quotes.count - 1
            }
        } else {
            currentQuoteIndex += 1
            
            if currentQuoteIndex >= quotes.count {
                currentQuoteIndex = 0
            }
        }

        updateUIByToggling()
    }
    
    @IBAction func toggleTopics(_ sender: UIBarButtonItem) {
        if sender.title == Storyboard.TopicsTitle {
            performSegue(withIdentifier: Storyboard.ShowTopicsSegueIdentifier, sender: sender)
        }
//        } else {
//            showQuoteOfTheDay()
//        }
    }

    // MARK: - Helpers
    
    private func configure(updatingCurrentIndex needsUpdate: Bool) {
        if let selectedTopic = topic {
            //toggleButton.title = Storyboard.TodayTitle

            quotes = QuoteDeck.sharedInstance.quotesForTag(selectedTopic)
            
            if needsUpdate {
                currentQuoteIndex = 0
            }
        } else {
            toggleButton.title = Storyboard.TopicsTitle

            let formatter = DateFormatter()
            
            formatter.dateFormat = "DDD"
            quotes = QuoteDeck.sharedInstance.quotes
            
            if needsUpdate {
                if let dayInYear = Int(formatter.string(from: Date())) {
                    currentQuoteIndex = dayInYear % quotes.count
                }
            }
        }
        
        updateUI()
    }

    private func increment(date: Date, by amount: Int = 1) -> Date {
        var dayComponent = DateComponents()
        
        dayComponent.day = amount
        
        return Calendar.current.date(byAdding: dayComponent, to: date)!
    }

    private func updateUIByToggling() {
        let quote = quotes[currentQuoteIndex]
        
        if let topicFilter = topic {
            // See http://bit.ly/2ctUdTI
            
            let fadeTextAnimation = CATransition()

            fadeTextAnimation.duration = 0.75
            fadeTextAnimation.type = CATransitionType.fade
            
            navigationController?.navigationBar.layer.add(fadeTextAnimation, forKey: "fadeText")
            navigationItem.title = "\(topicFilter.capitalized)" 
        }
    }

    private func updateUI() {
        let quote = quotes[currentQuoteIndex]
        
        if let topicFilter = topic {
            title = "\(topicFilter.capitalized)"//" (\(currentQuoteIndex + 1) of \(quotes.count))"
        } else {
            title = Storyboard.QuoteOfTheDayTitle
        }
        textView.text = quote.text
    }
    
    // MARK: - Segues
    
    @IBAction func exitModalScene(_ segue: UIStoryboardSegue) {
        // In this case, there is nothing to do, but we need a target (exitModalScene)
    }
    
    @IBAction func showTopicQuotes(_ segue: UIStoryboardSegue) {
        configure(updatingCurrentIndex: true)
    }
}

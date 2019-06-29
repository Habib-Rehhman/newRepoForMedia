
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
        super.viewDidLoad()
        
        configure(updatingCurrentIndex: true)

    }
    
    // MARK: - Helpers
    
    private func configure(updatingCurrentIndex needsUpdate: Bool) {
        if let selectedTopic = topic {
            quotes = QuoteDeck.sharedInstance.quotesForTag(selectedTopic)
            
            if needsUpdate {
                currentQuoteIndex = 0
            }
        } else {
            toggleButton.title = Storyboard.TopicsTitle
            quotes = QuoteDeck.sharedInstance.quotes
        }
        
        updateUI()
    }

    private func updateUIByToggling() {
        
        if let topicFilter = topic {
     
            
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
    
}

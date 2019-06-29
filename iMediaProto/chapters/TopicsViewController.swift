
//
import UIKit

class TopicsViewController : UITableViewController, UIDataSourceModelAssociation {
    
    // MARK: - Constants
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    private struct Storyboard {
        static let TopicCellIdentifier = "TopicCell"
        static let ShowQuoteSegueIdentifier = "ShowQuote"
    }
    
    // MARK: - Properties
    var selectedTopic: String?
    
    // MARK: - View controller lifecycle
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? QuoteViewController {
            destinationVC.topic = selectedTopic
        }
    }
    
    // MARK: - Data source model association
    
    func indexPathForElement(withModelIdentifier identifier: String, in view: UIView) -> IndexPath? {
        let row = QuoteDeck.sharedInstance.tagSet.firstIndex(of: identifier) ?? 0
        
        return IndexPath(row: row, section: 0)
    }
    
    func modelIdentifierForElement(at idx: IndexPath, in view: UIView) -> String? {
        return QuoteDeck.sharedInstance.tagSet[idx.row]
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuoteDeck.sharedInstance.tagSet.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.TopicCellIdentifier)!
        
        cell.textLabel?.text = QuoteDeck.sharedInstance.tagSet[indexPath.row].capitalized
        
        tableView.backgroundColor = UIColor(hexString: "#A5DEFF")//.gray
        
        cell.layer.borderWidth = CGFloat(15)
        cell.layer.borderColor = tableView.backgroundColor?.cgColor
        
        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedTopic = QuoteDeck.sharedInstance.tagSet[indexPath.row]
        performSegue(withIdentifier: Storyboard.ShowQuoteSegueIdentifier, sender: self)
    }
}

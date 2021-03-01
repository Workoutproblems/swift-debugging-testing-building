//
//  ViewController.swift
//  iOSDebugFundamentals_Storyboard
//

import UIKit

class FixerUpperListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var fixerUppers = fixerUpperData
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    // MARK: Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fixerUppers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FixerUpperCell")!
        
        let fixerUpper = self.fixerUppers[indexPath.row]
        
        cell.textLabel?.text = fixerUpper.name
        cell.detailTextLabel?.text = fixerUpper.askingPrice
        cell.imageView?.image = fixerUpper.image
        
        return cell
    }
    
    // MARK: - Table View Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destinationVC = segue.destination as! FixerUpperDetailsViewController
        
        let selectedIndexPath = self.tableView.indexPathForSelectedRow!
        let selectedFixerUpper = self.fixerUppers[selectedIndexPath.row]
        
        destinationVC.fixerUpper = selectedFixerUpper
    }
}


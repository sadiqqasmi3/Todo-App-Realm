//
//  ItemTableViewController.swift
//  Todo App Realm
//
//  Created by sadiq qasmi on 24/02/2021.
//

import UIKit

class ItemTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @IBAction func addItemButton(_ sender: UIBarButtonItem) {
        
        
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    // MARK: - Table view data source

}
extension ItemTableViewController: UISearchBarDelegate{
    
    
    
}

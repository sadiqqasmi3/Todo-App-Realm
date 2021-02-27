//
//  ItemTableViewController.swift
//  Todo App Realm
//
//  Created by sadiq qasmi on 24/02/2021.
//

import UIKit
import RealmSwift

class ItemTableViewController: UITableViewController {
    var selectedCategory: Category? {
        didSet{
            loadData()
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    let realm = try! Realm()
    
    var item : Results<Item>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.itemCellID, for: indexPath)
        cell.textLabel?.text = item?[indexPath.row].title
        return cell
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item?.count ?? 1
    }
    // MARK: - Table view delegate
    
    let newItem = Item()
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if newItem.done == false{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else{
            newItem.done = true
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    @IBAction func addItemButton(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add your item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { [self] (action) in
            
            newItem.title = textField.text!
            save(item: newItem)
            
        }
        alert.addAction(action)
        alert.addTextField { (textfield) in
            textField = textfield
        }
        present(alert, animated: true, completion: nil)
    }
    
    
    // MARK: - CURD operations on RealmSwift
    
    func save(item: Item){
        
        do{
            try realm.write {
                realm.add(item)
            }
        }catch{
            print("Error while add item : \(error)")
        }
    }
    
    func loadData() {
        
        item = realm.objects(Item.self)
        tableView.reloadData()
    }
}

extension ItemTableViewController: UISearchBarDelegate{
    
}

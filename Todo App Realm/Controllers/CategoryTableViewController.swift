//
//  CategoryTableViewController.swift
//  Todo App Realm
//
//  Created by sadiq qasmi on 24/02/2021.
//

import UIKit
import RealmSwift

class CategoryTableViewController: UITableViewController {
    
    let realm = try! Realm()
    var category: Results<Category>?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.toItemsSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ItemTableViewController
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return category?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.categoryCellID, for: indexPath)
        cell.textLabel!.text = category?[indexPath.row].name ?? "No Category Added"
        return cell
    }
    
    @IBAction func addCategoryButton(_ sender: UIBarButtonItem) {
        
        var textField  = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle:.alert)
        let action = UIAlertAction(title: "Add", style: .default) {[self] (action) in
            
            let newCategory = Category()
            newCategory.name = textField.text!
            
            save(category: newCategory)
            
        }
        alert.addAction(action)
        alert.addTextField { (textfield) in
            textField = textfield
            
        }
        present(alert, animated: true, completion: nil)
        
    }
    //MARK: -CURD operations on RealmSwift
    
    func save(category: Category) {
        
        do{
            try realm.write {
                realm.add(category)
            }
        }catch{
            print("Error while saving data : \(error)")
        }
        tableView.reloadData()
    }
    
    func loadData() {
        
        category = realm.objects(Category.self)
        tableView.reloadData()
    }
}

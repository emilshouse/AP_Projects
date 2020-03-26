//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Admin on 3/15/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var categories: Results<Category>?
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()

    }

    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = categories?[indexPath.row]
        
        cell.textLabel?.text = category?.name ?? "No Categories to load."
        
       // cell.accessoryType = category.done ? .checkmark : .none
        
        
        
        return cell
        
    }
    
    
    
    //MARK: - Data Manipulation Methods
    
    func loadCategories() {

         categories = realm.objects(Category.self)

        tableView.reloadData()
    }

    func save(category: Category) {


        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context, \(error)")
        }

        tableView.reloadData()

    }
    
    
    //MARK: - Add new Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()

        let ac = UIAlertController(title: "Add new Category.", message: "List em up!", preferredStyle: .alert)
        ac.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "Add Category..."
            textField = alertTextfield
        }
        let action = UIAlertAction(title: "Add item", style: .default, handler: { (action) in
            
            let newCategory = Category()
            newCategory.name = textField.text!
    
          //  self.categories.append(newCategory)
            self.save(category: newCategory)

        })

        ac.addAction(action)
        present(ac, animated: true)
    }
    
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  //      tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "itemsSegue", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
                
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories?[indexPath.row]
        }
    }
    
    
    
}

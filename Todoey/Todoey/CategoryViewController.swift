//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Admin on 3/15/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categories = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()

    }

    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = categories[indexPath.row]
        
        cell.textLabel?.text = category.name
        
       // cell.accessoryType = category.done ? .checkmark : .none
        
        
        
        return cell
        
    }
    
    
    
    //MARK: - Data Manipulation Methods
    
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {

        do {
        categories = try context.fetch(request)
        } catch {
            print("Error loading categories \(error)")
        }

        tableView.reloadData()
    }

    func saveCategories() {


        do {
            try context.save()
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
            let newCategory = Category(context: self.context)

            newCategory.name = textField.text!
    
            self.categories.append(newCategory)
            self.saveCategories()

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
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
    
    
    
}

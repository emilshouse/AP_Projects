//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()

    let defaults = UserDefaults.standard


    override func viewDidLoad() {
            super.viewDidLoad()
         //   let newItem = Item(title: "Find Mike")

            itemArray = loadItems()

        }



    //MARK:- TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row].title
        return cell
    }

    //MARK:- TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }



    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }

    //MARK:- New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()

        let ac = UIAlertController(title: "Add new item.", message: "List em up!", preferredStyle: .alert)
        ac.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "Add item..."
            textField = alertTextfield
        }
        let action = UIAlertAction(title: "Add item", style: .default, handler: { (action) in
            if let text = textField.text {
                self.itemArray.append(Item(title: text))
                self.saveItems()
            }
            self.tableView.reloadData()
        })

        ac.addAction(action)
        present(ac, animated: true)

    }
    //MARK:- User default methods
    func loadItems() -> [Item] {
           guard let savedItems = defaults.array(forKey: "TodoListArray") as? [Item] else { return [Item(title: "No Item")] }

           return savedItems

       }

       func saveItems() {
           defaults.set(itemArray, forKey: "TodoListArray")
        
       }


    


}


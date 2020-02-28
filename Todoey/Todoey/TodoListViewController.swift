//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)


    override func viewDidLoad() {
        super.viewDidLoad()


//        let newItem = Item(context: self.context)
//        itemArray.append(newItem)

        loadItems()

    }

    //MARK:- TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)

        let item = itemArray[indexPath.row]

        cell.textLabel?.text = item.title

        cell.accessoryType = item.done ? .checkmark : .none

        return cell
    }

    //MARK:- TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //Remove the cell highlight.

        context.delete(itemArray[indexPath.row])
        itemArray.remove(at: indexPath.row)
        
    //   itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        saveItems()


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
            let newItem = Item(context: self.context)

            newItem.title = textField.text!
            newItem.done = false
            self.itemArray.append(newItem)
            self.saveItems()

        })

        ac.addAction(action)
        present(ac, animated: true)

    }
    //MARK:- User default methods
    func loadItems() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        do {
        itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
    }

    func saveItems() {


        do {
            try context.save()
        } catch {
            print("Error saving context, \(error)")
        }

        tableView.reloadData()

    }


    


}


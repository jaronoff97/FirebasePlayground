//
//  GroceryListTableViewController.swift
//  
//
//  Created by Jacob Aronoff on 8/22/17.
//
//

import UIKit

class GroceryListTableViewController: UITableViewController {
    
    var firebase: FirebaseInitialization?
    var items: [FirebaseItem]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firebase = FirebaseInitialization(delegate: self)
        items = firebase!.getItems()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groceryItem", for: indexPath)
        cell.textLabel?.text = items![indexPath.row].name
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.items?[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
extension GroceryListTableViewController: FirebaseTableDelegate {
    func reloadData() {
        items = firebase?.getItems()
        self.tableView.reloadData()
    }
}

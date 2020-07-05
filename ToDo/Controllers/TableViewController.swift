//
//  TableViewController.swift
//  ToDo
//
//  Created by Ivan Costa on 02/07/20.
//  Copyright © 2020 Ivan Costa. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = true
        self.tableView.reloadData()
    }

    @IBAction func newTask(_ sender: Any) {
        let create = AddViewController(nibName: "AddViewController", bundle: nil)
        navigationController?.pushViewController(create, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserDefaults.standard.array(forKey: "tasks")?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let tasks = UserDefaults.standard.array(forKey: "tasks") ?? []
        let task = tasks[indexPath.row]
        cell.prepare(with:task as! Array<String>)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let create = AddViewController(nibName: "AddViewController", bundle: nil)
            create.taskIndex = indexPath.row
            navigationController?.pushViewController(create, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            var tasks = UserDefaults.standard.array(forKey: "tasks") ?? []
            tasks.remove(at: indexPath.row)
            UserDefaults.standard.set(tasks, forKey: "tasks")
            self.tableView.reloadData()
        }
    }

}

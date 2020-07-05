//
//  AddViewController.swift
//  ToDo
//
//  Created by Ivan Costa on 02/07/20.
//  Copyright © 2020 Ivan Costa. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var task: UITextField!
    
    var taskName : String?
    var taskIndex : Int = -1
    var edit = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "To Do";
        
        if (taskIndex != -1){
            let tasks = UserDefaults.standard.array(forKey: "tasks")
            let taskedit = tasks?[taskIndex] as! Array<String>;
            task.text = taskedit[0]
            edit = true
        } else {
            taskName = ""
        }
    }


    @IBAction func save(_ sender: Any) {
    
        taskName = task?.text ?? ""
        
        if(taskName == nil || taskName?.trimmingCharacters(in:.whitespacesAndNewlines) == ""){
            return
        }
        
        let task1 = [taskName]
        var tasks = UserDefaults.standard.array(forKey: "tasks") ?? []
        
        if(edit){
            tasks[taskIndex] = task1
        } else {
            tasks.append(task1)
        }
        
        UserDefaults.standard.set(tasks, forKey: "tasks")
        navigationController?.popViewController(animated: true)
    }

}

//
//  ViewController.swift
//  DoIt
//
//  Created by Muhaimin Habib on 4/1/17.
//  Copyright © 2017 Biswajit banik. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var tasks : [Task] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = makeTasks()
        
        tableview.dataSource = self
        tableview.delegate = self
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important {
        
            cell.textLabel?.text = "❗️\(task.name)"
        
        }else{
        
            cell.textLabel?.text = task.name
        
        }
        
        return cell
    }
    func makeTasks() -> [Task] {

        let task1 = Task()
        task1.name = "Working"
        task1.important = true
        
        
        let task2 = Task()
        task2.name = "mutable"
        task2.important = true
        
        
        let task3 = Task()
        task3.name = " not Working"
        task3.important = false
        
        return [task1 ,task2 ,task3]
        
        
        
    }

    @IBAction func addACTION(_ sender: Any) {
        
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
}


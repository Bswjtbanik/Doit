//
//  TasksViewController.swift
//  DoIt
//
//  Created by Muhaimin Habib on 4/1/17.
//  Copyright © 2017 Biswajit banik. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
   
    //var selectedIndex = 0
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableview.dataSource = self
        tableview.delegate = self
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important {
        
            cell.textLabel?.text = "❗️\(task.name!)"
        
        }else{
        
            cell.textLabel?.text = task.name!
        
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
   
    @IBAction func addACTION(_ sender: Any) {
        
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    func getTasks(){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
       
        do{
        
            tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        
        }catch{
            
            print("OOPS we have an error!")
        }
    }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
            if segue.identifier == "selectTaskSegue" {
            let nextVC  = segue.destination as! CompletTaskViewController
            nextVC.task = sender as? Task
           // nextVC.previousVC = self
         
        }
        
        
        
    }
}


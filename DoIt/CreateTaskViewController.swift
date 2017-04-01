//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Muhaimin Habib on 4/1/17.
//  Copyright © 2017 Biswajit banik. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameField: UITextField!
    @IBOutlet weak var important: UISwitch!
    
   
    var previousVC = TasksViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
@IBAction func AddACTION(_ sender: Any) {
    
     let task = Task()
     task.name = taskNameField.text!
     task.important = important.isOn
    
    previousVC.tasks.append(task)
    previousVC.tableview.reloadData()
    navigationController!.popViewController(animated: true)
    
    }

}

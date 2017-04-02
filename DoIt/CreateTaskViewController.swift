//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Muhaimin Habib on 4/1/17.
//  Copyright © 2017 Biswajit banik. All rights reserved.
//

import UIKit
import CoreData

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameField: UITextField!
    @IBOutlet weak var important: UISwitch!
    
    //var previousVC = TasksViewController()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func addbutton(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        
        task.name = taskNameField.text!
        task.important = important.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    
    }
    


}

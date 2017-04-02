//
//  CompletTaskViewController.swift
//  DoIt
//
//  Created by Muhaimin Habib on 4/1/17.
//  Copyright © 2017 Biswajit banik. All rights reserved.
//

import UIKit
import CoreData

class CompletTaskViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    var task : Task? = nil
    //var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if task!.important {
        taskLabel.text = "❗️\(task!.name!)"
        }else
        {
        taskLabel.text = task!.name!
        }
       }

    @IBAction func completACTION(_ sender: Any) {
   
        
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     context.delete(task!)
     (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    navigationController!.popViewController(animated: true)
    
    
    }
   

}

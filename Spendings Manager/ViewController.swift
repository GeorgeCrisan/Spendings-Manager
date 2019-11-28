//
//  ViewController.swift
//  Spendings Manager
//
//  Created by George Crisan on 26/11/2019.
//  Copyright © 2019 George Crisan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
  let persistenceManager: PersistenceManager
  
  init (persistenceManager: PersistenceManager) {
    self.persistenceManager = persistenceManager
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      createBudget();
      getBudget();
      print("George is up")
      
    }
  
  func createBudget() {
    let budget = Budget(context: persistenceManager.context);

    budget.created = Date()
    budget.id = UUID();
    budget.title = "Demo Budget 2"
    budget.total = 0
    persistenceManager.save()
    
  }
  
  func getBudget() {
    let budgets = persistenceManager.fetch(Budget.self)
    budgets.forEach({ print($0.title, $0.created) })
  }
}


//
//  ViewController.swift
//  Spendings Manager
//
//  Created by George Crisan on 26/11/2019.
//  Copyright © 2019 George Crisan. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
 
  let persistenceManager: PersistenceManager
  
  var budgets = [Budget]();
  
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
      view.backgroundColor = .blue
      setupAddBudgetButton()
      getBudget();
      //createBudget();
      updateBudget();
      
      
    }
  //First Page Layout
  let addBudget = UIButton();
  
  func setupAddBudgetButton() {
    addBudget.backgroundColor = .black;
    addBudget.showsTouchWhenHighlighted = true;
    addBudget.setTitleColor(.white, for: .normal)
    addBudget.setTitle("Add Budget", for: .normal)
    
    addBudget.addTarget(self, action: #selector(showAddBuddgetForm), for: .touchDown)
    
    view.addSubview(addBudget)
    setAddBudgetConstrains()
  }
  
  @objc func showAddBuddgetForm() {
    let nextScreen = BudgetForm();
    nextScreen.title = "Test";
    navigationController?.pushViewController(nextScreen, animated: false)
  }
  
  func setAddBudgetConstrains() {
    addBudget.translatesAutoresizingMaskIntoConstraints = false;
    //position the button
    addBudget.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    addBudget.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
    addBudget.heightAnchor.constraint(equalToConstant: 40).isActive = true
    addBudget.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 240).isActive = true
  }
  
  
  //Utils
  func showBudgets(withDelete: Bool  = false) {
    budgets.forEach({ print($0.title , $0.total, $0.created) });
    if(withDelete) {
      print(" with delete ");
      budgets.forEach({ deleteBudget(budget: $0) })
    }
  }
  
  
  
  //CRUD methods
  func createBudget() {
    let budget = Budget(context: persistenceManager.context);

    budget.created = Date()
    budget.id = UUID();
    budget.title = "Test"
    budget.total = 0
    persistenceManager.save()
    
  }
  
  func updateBudget() {
    let firstBudget = budgets.first!
    
    if(firstBudget.total > -1) {
      firstBudget.total += 1000
      
      persistenceManager.save()
      print("show after update", firstBudget.total);
    }
  }
  
  func deleteBudget(budget: Budget) {
    
    persistenceManager.context.delete(budget);
    do {
      try persistenceManager.context.save();
    } catch {
    print("error from delete");
    }
  }
  
  func getBudget() {
    let budgets = persistenceManager.fetch(Budget.self)
    self.budgets = budgets;
    showBudgets(withDelete: false)
  }
}


//
//  AppDelegate.swift
//  Spendings Manager
//
//  Created by George Crisan on 26/11/2019.
//  Copyright © 2019 George Crisan. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
  var window: UIWindow?
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
      let vc = RootViewController(persistenceManager: PersistenceManager.shared);
      //use the root view controller as index page
      let navController = UINavigationController(rootViewController: vc)
      window = UIWindow(frame: UIScreen.main.bounds)
      window?.rootViewController = navController;
      window?.makeKeyAndVisible();
      
        return true
    }
  
}

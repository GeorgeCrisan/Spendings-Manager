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
      
      let vc = ViewController(persistenceManager: PersistenceManager.shared);
      window = UIWindow(frame: UIScreen.main.bounds)
      window?.rootViewController = vc;
      window?.makeKeyAndVisible();
      
        return true
    }
}

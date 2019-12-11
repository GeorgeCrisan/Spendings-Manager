//
//  PersistenceManager.swift
//  Spendings Manager
//
//  Created by George Crisan on 27/11/2019.
//  Copyright © 2019 George Crisan. All rights reserved.
//

import Foundation
import CoreData

final class PersistenceManager {
  
  private init() {}
  
  static let shared = PersistenceManager();
  
  // MARK: - Core Data stack

      lazy var persistentContainer: NSPersistentContainer = {
          // The store Same like Redux ?
          let container = NSPersistentContainer(name: "Spendings_Manager")
          container.loadPersistentStores(completionHandler: { (storeDescription, error) in
              if let error = error as NSError? {
                  // Replace this implementation with code to handle the error appropriately.
                  // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                   
                  /*
                   Typical reasons for an error here include:
                   * The parent directory does not exist, cannot be created, or disallows writing.
                   * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                   * The device is out of space.
                   * The store could not be migrated to the current model version.
                   Check the error message to determine what the actual problem was.
                   */
                  fatalError("Unresolved error \(error), \(error.userInfo)")
              }
          })
          return container
      }()
  
      lazy var context = persistentContainer.viewContext

      // MARK: - Core Data Saving support

      func save() {
          if context.hasChanges {
              do {
                  print("Context saved successfully! at-", Date())
                  try context.save()
              } catch {
                  print("not working")
                  // Replace this implementation with code to handle the error appropriately.
                  // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                  let nserror = error as NSError
                  fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
              }
          }
      }
  
    func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T] {
      
      let entityName = String(describing: objectType)
      
      let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
      
      do {
        let fetchedObjects = try context.fetch(fetchRequest) as? [T]
        return fetchedObjects ?? [T]()
      } catch {
         print(error)
         return [T]()
      }
    }
  
  func delete(_ object: NSManagedObject) {
    context.delete(object)
    save();
  }

  }

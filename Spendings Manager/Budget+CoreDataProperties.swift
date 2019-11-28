//
//  Budget+CoreDataProperties.swift
//  Spendings Manager
//
//  Created by George Crisan on 27/11/2019.
//  Copyright © 2019 George Crisan. All rights reserved.
//
//

import Foundation
import CoreData


extension Budget {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Budget> {
        return NSFetchRequest<Budget>(entityName: "Budget")
    }

    @NSManaged public var total: Double
    @NSManaged public var title: String
    @NSManaged public var id: UUID
    @NSManaged public var created: Date

}

//
//  CoreDataEntity+CoreDataProperties.swift
//  
//
//  Created by Lilia on 8/17/20.
//
//

import Foundation
import CoreData


extension CoreDataEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CoreDataEntity> {
        return NSFetchRequest<CoreDataEntity>(entityName: "CoreDataEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var title: String?
    @NSManaged public var abstract: String?
    @NSManaged public var image: String?
    @NSManaged public var url: URL?

}

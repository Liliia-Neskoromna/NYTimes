//
//  Service.swift
//  TestForVRGSoft
//
//  Created by Lilia on 8/14/20.
//  Copyright © 2020 Liliia. All rights reserved.
//
//import Foundation
//import CoreData
//
//class PersistanceService {
//    private init() {}
//    static let shared = PersistanceService()
//    lazy var context: NSManagedObjectContext = persistentContainer.viewContext
//
//    lazy var persistentContainer: NSPersistentContainer = {
//
//        let container = NSPersistentContainer(name: "WeatherApp")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//
//    // MARK: - Core Data Saving support
//
//    func save () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
//}
//

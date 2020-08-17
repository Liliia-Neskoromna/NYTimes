

import Foundation
import CoreData

class PersistanceService {
    private init() {}
    static let shared = PersistanceService()
    lazy var context: NSManagedObjectContext = persistentContainer.viewContext

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "EntityArticle")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func save () {
        let context = persistentContainer.viewContext
        context.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func propertiesToFetch() -> [Int] {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreDataEntity")
        fetchRequest.returnsObjectsAsFaults = false
        fetchRequest.propertiesToFetch = ["key"]
        fetchRequest.resultType = .dictionaryResultType

        var arrayId = [Int]()
        
        do {
            let keys = try context.fetch(fetchRequest)
            for data in keys {
                let arid = (data as AnyObject).value(forKey: "key") as! Int
                arrayId.append(arid) }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo) ")
        }
        
        return arrayId
    }
}


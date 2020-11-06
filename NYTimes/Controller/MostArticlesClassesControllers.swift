//
//  MostArticlesClassesControllers.swift
//  NYTimes
//
//  Created by Lilia on 8/17/20.
//  Copyright © 2020 Liliia. All rights reserved.
//

import UIKit
import CoreData

class MostViewedController: ArticlesMainViewController {
    
    override func viewDidLoad() {
        super.currentControllerType = .mostViewed
        super.viewDidLoad()
    }
}

class MostSharedController: ArticlesMainViewController {
    
    override func viewDidLoad() {
        super.currentControllerType = .mostShared
        super.viewDidLoad()
    }
}

class MostEmailedController: ArticlesMainViewController {
    
    override func viewDidLoad() {
        super.currentControllerType = .mostEmailed
        super.viewDidLoad()
        
    }
}

class FavoriteController: ArticlesMainViewController {
    
    override func viewDidLoad() {
        super.isFetchEnable = false
        super.viewDidLoad()
        setupCoreData()
        
    }
    
    func mapToModel(entity: Array<CoreDataEntity>) -> [ArticleModel] {
        var list: [ArticleModel] = []
        for element in entity {
            
            let newId = element.key
            let newTitle = element.title ?? ""
            let newAbstract = element.abstract ?? ""
            let newImage = element.image ?? ""
            let newUrl = element.url
            
            var element = ArticleModel.init(id: Int(newId), title: newTitle, abstract: newAbstract, image: newImage, url: newUrl)
            element.isSelected = true
            list.append(element)
        }
        return list
    }
    
    func setupCoreData() {
        NotificationCenter.default.addObserver(self,
        selector: #selector(contextDidSaveNotification(notification:)),
        name: NSNotification.Name.NSManagedObjectContextDidSave,
        object: context)
        loadDataInfo()
    }
    
    func loadDataInfo() {
        let loadedData = loadCoreData()
        let list = mapToModel(entity: loadedData)
        print(list)
        super.articles = list
        
        tableView.reloadData()
    }
    
    func loadCoreData() -> [CoreDataEntity] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:  "CoreDataEntity")
        fetchRequest.returnsObjectsAsFaults = false
        
        var articles = [CoreDataEntity]()
        
        do {
            articles = try context.fetch(fetchRequest) as! [CoreDataEntity]
        } catch let error as NSError {
            print("Error While Fetching Data From DB: \(error.userInfo)")
        }
        return articles
        
        
    }
    
    @objc func contextDidSaveNotification(notification: NSNotification) {
        loadDataInfo()
    }
}

	

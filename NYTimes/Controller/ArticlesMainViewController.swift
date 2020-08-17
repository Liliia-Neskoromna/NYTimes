//
//  ViewController.swift
//  TestForVRGSoft
//
//  Created by Lilia on 8/13/20.
//  Copyright © 2020 Liliia. All rights reserved.
//

import UIKit
import Foundation
import WebKit
import Alamofire
import SwiftyJSON
import CoreData

enum CurrentControllerType: String {
    case mostViewed, mostShared, mostEmailed
    
    var urlString: String {
        switch self {
        case .mostEmailed:
            return "https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json"
        case .mostShared:
            return "https://api.nytimes.com/svc/mostpopular/v2/shared/30.json"
        default:
            return "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json"
        }
    }
}

class ArticlesMainViewController: UITableViewController {
    
    let persistence = PersistanceService.shared
    let context = PersistanceService.shared.context
    var coreDataArticle : [ArticleModel] = []
    var dict = NSMutableDictionary()
    var isFetchEnable = true
    
    let kReUseId = "cellForArticles"
    
    let params: [String: String] = ["api-key": "kcZPVVrUr4PUmXGnWGT8trQK1pe7A7mX"]
    
    var articles = [ArticleModel]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    var currentControllerType: CurrentControllerType = .mostEmailed
    
    @IBAction func goToDetails(_ sender: UIButton) {
        performSegue(withIdentifier: "showDetails", sender: nil)
    }
    
    @IBAction func addArticlesForFavorite(_ sender: CustomButton) {
        let index = sender.index
        
        if sender.isSelected {
            articles[index].isSelected = false
            
        } else {
            
            let entity = NSEntityDescription.insertNewObject(forEntityName: "CoreDataEntity", into: context)
            let key = articles[index].id
            entity.setValue(key, forKey: "key")
            let image = articles[index].image
            entity.setValue(image, forKey: "image")
            let title = articles[index].title
            entity.setValue(title, forKey: "title")
            let abstract = articles[index].abstract
            entity.setValue(abstract, forKey: "abstract")
            let url = articles[index].url
            entity.setValue(url, forKey: "url")
            
            do {
                try persistence.context.save()
                articles[index].isSelected = true
            } catch {
                print("error")
            }
            print(entity)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isFetchEnable {
            print("LOAD DATA")
            loadData()
        }
        
        var titleView: UIImageView
        let frame = CGRect(x: 0, y: 0, width: 50, height: 25)
        titleView = UIImageView(frame: frame)
        titleView.contentMode = .scaleAspectFit
        titleView.image = UIImage(named: "NYTimes_logo")
        self.navigationItem.titleView = titleView
        
    }
    
    func loadData() {
        AF.request(currentControllerType.urlString as! URLConvertible, method: .get, parameters: params).responseJSON { (response) in
            
            switch response.result {
            case .success:
                
                guard (try? response.result.get()) != nil else {
                    fatalError("Cannot get data")
                }
                guard let json = try? JSON(response.result.get()) else {
                    fatalError("Cannot get json")
                }
                let results = json["results"].arrayValue
                
                let arrayKeys = self.persistence.propertiesToFetch()
                
                for result in results {
                    
                    let id = result["id"].intValue
                    let title = result["title"].stringValue
                    let abstract = result["abstract"].stringValue
                    let image = result["media"][0]["media-metadata"][0]["url"].stringValue
                    let url = result["url"].url
                    var article = ArticleModel(id: id, title: title, abstract: abstract, image: image, url: url)
                    
                    article.isSelected = arrayKeys.contains(id)
                    
                    self.articles.append(article)
                }
            case let .failure(error):
                print(error)
                
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: kReUseId,
                                                            for: indexPath) as? ArticleTableViewCell else {fatalError("Bad Cell")}
        
        cell.titleLabel?.text = self.articles[indexPath.row].title
        cell.detailsLabel?.text = self.articles[indexPath.row].abstract
        cell.imageArt.imageFromServerURL(self.articles[indexPath.row].image)
        cell.favButton.index = indexPath.row
        cell.favButton.isSelected = self.articles[indexPath.row].isSelected
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlString = articles[indexPath.row].url
        let webViewIdentifier = WebViewController.storyboardIdentifier
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let webViewController = storyboard.instantiateViewController(identifier: webViewIdentifier) as? WebViewController {
            webViewController.url = urlString
            present(webViewController, animated: true)
        }
    }
    
}


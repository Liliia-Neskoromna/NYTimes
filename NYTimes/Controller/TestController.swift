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

enum CurrentControllerType: String {
    case news, articles
    
    var urlString: String {
        switch self {
        case .news:
            return "https://api.nytimes.com/svc/mostpopular/v2/emailed/1.json"
        default:
            return "https://api.nytimes.com/svc/mostpopular/v2/emailed/1.json"
        }
    }
}

class ArticlesMainViewController: UITableViewController {
    
    let sharedRequest = ArticlesRequest()
    let kReUseId = "cellForArticles"
    
    let params: [String: String] = ["api-key": "kcZPVVrUr4PUmXGnWGT8trQK1pe7A7mX"]
   
    
    var allArticlesIds = [Int]()
    var allArticlesTitles = [String]()
    var allArticlesAbsrtacts = [String]()
    var allArticlesImages = [String]()
    var allArticlesUrls = [URL]()
    var currentControllerType: CurrentControllerType = .news
    
    @IBAction func goToDetails(_ sender: UIButton) {
        performSegue(withIdentifier: "showDetails", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        //prepareForSegue(segue: , sender: goToDetails)
        var titleView: UIImageView
        let frame = CGRect(x: 0, y: 0, width: 50, height: 25)
        titleView = UIImageView(frame: frame)
        titleView.contentMode = .scaleAspectFit
        titleView.image = UIImage(named: "NYTimes_logo")
        self.navigationItem.titleView = titleView
    }
    
    func loadData() {
        AF.request(currentControllerType.urlString, method: .get, parameters: params).responseJSON { (response) in
            
            guard (try? response.result.get()) != nil else {
                fatalError("Cannot get data")
            }
            guard let json = try? JSON(response.result.get()) else {
                fatalError("Cannot get json")
            }
            let results = json["results"].arrayValue
            
            for result in results {
                let id = result["id"].intValue
                let title = result["title"].stringValue
                let abstract = result["abstract"].stringValue
                let image = result["media"][0]["media-metadata"][0]["url"].stringValue
                let url = result["url"].url
                
                self.allArticlesIds.append(id)
                self.allArticlesTitles.append(title)
                self.allArticlesAbsrtacts.append(abstract)
                self.allArticlesImages.append(image)
                self.allArticlesUrls.append(url!)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allArticlesTitles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: kReUseId,
                                                            for: indexPath) as? ArticleTableViewCell else {fatalError("Bad Cell")}
        
        cell.titleLabel?.text = self.allArticlesTitles[indexPath.row]
        cell.detailsLabel?.text = self.allArticlesTitles[indexPath.row]
        cell.imageArt.imageFromServerURL(self.allArticlesImages[indexPath.row])
        
            //ArticlesMainViewController.allArticlesUrls[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlString = allArticlesUrls[indexPath.row]
        let webViewIdentifier = WebViewController.storyboardIdentifier
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let webViewController = storyboard.instantiateViewController(identifier: webViewIdentifier) as? WebViewController {
            webViewController.url = urlString
            present(webViewController, animated: true)
        }
    }
    
}


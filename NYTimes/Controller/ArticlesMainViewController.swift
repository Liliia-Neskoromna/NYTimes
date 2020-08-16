////
////  ViewController.swift
////  TestForVRGSoft
////
////  Created by Lilia on 8/13/20.
////  Copyright © 2020 Liliia. All rights reserved.
////
//
//import UIKit
//import Alamofire
//import AlamofireImage
//
//class ArticlesMainViewController: UITableViewController {
//    
//    
//    let sharedRequest = ArticlesRequest()
//    let kReUseId = "cellForArticles"
//    
////    var listOfArticles = [Article](){
////        didSet {
////            DispatchQueue.main.async {
////                self.tableView.reloadData()
////            }
////        }
////    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        sharedRequest.loadData()
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//
//    }
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return listOfArticles.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: kReUseId,
//                                                            for: indexPath)
//            as? ArticleTableViewCell else {fatalError("Bad Cell")}
//        let list = listOfArticles[indexPath.row]
//        
//        let title = list.title
//        cell.titleLabel?.text = title
//        
//        //        let image = list.image
//        //        cell.imageArt.imageFromServerURL(urlString: image)
//        
//        return cell
//    }
//    
//}
//
//// MARK: - Extension for Icon
//
//var imageCache = NSCache<NSString, UIImage>()
//extension UIImageView {
//   
//    public func imageFromServerURL(_ urlString: String) {
//        self.image = nil
//        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
//            self.image = cachedImage
//            return
//        }
//        
//        AF.request(urlString)
//            .responseImage {response in
//                if let downloadedImage = try? response.result.get() {
//                    imageCache.setObject(downloadedImage, forKey: urlString  as NSString)
//                    self.image = downloadedImage
//                }
//        }
//    }
//}

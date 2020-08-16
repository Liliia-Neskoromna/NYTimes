//
//  WebViewController.swift
//  NYTimes
//
//  Created by Lilia on 8/16/20.
//  Copyright © 2020 Liliia. All rights reserved.
//

import UIKit
import Foundation
import WebKit

class WebViewController: UIViewController {
    static let storyboardIdentifier = "WebViewControllerIdentifier"
    
    @IBOutlet var webView: WKWebView?
    
    let sharedRequest = ArticlesMainViewController()
    var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebView()
    }
        
    func loadWebView() {
        if let urlUnwrappted = url {
            webView?.load(URLRequest(url: urlUnwrappted))
            webView?.allowsBackForwardNavigationGestures = true
        }
    }
}

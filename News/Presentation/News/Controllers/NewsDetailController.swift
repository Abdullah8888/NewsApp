//
//  NewsDetailController.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import Foundation
import UIKit

class NewsDetailController: BaseController<NewsDetailView> {
    
    var newsUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavbar(tintColor: .white)
        if let newsUrl = newsUrl {
            if let url = URL(string: newsUrl) {
                _view.webView.load(URLRequest(url: url))
            }
        }
        
        _view.webView.allowsBackForwardNavigationGestures = true
        showLoader()
        
        _view.webViewDidFinishShowing = weakify({ strongSelf in
            strongSelf.removeLoader()
        })
    }
}

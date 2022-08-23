//
//  NewsDetailView.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import Foundation
import UIKit
import WebKit

class NewsDetailView: BaseView {
    
    lazy var webView: WKWebView = {
        let wkWebView = WKWebView.init(frame: .zero)
        wkWebView.navigationDelegate = self
        return wkWebView
    }()
    
    var webViewDidFinishShowing: (() -> ())?
    
    override func setup() {
        super.setup()
        addSubview(webView)
        webView.fillUpSuperview()
    }
}

extension NewsDetailView: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        webViewDidFinishShowing?()
    }
}

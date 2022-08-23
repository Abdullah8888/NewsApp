//
//  NewsController.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import Foundation
import UIKit

class NewsController: BaseController<NewsView> {

    var viewModel: NewsViewModel?
    lazy var navigator = Navigator()
    lazy var viewDIContainer = ViewDIContainer.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavbar()
        
        viewModel?.news.subscribe(weakify({ strongSelf, news in
            strongSelf._view.article = news.element?.articles ?? []
            strongSelf.removeLoader()
        })).disposed(by: disposeBag)
        
        viewModel?.errorHandler.subscribe(weakify({ strongSelf, error in
            strongSelf.showToastWithTItle(error.element?.message ?? "asdfadfd", type: .error)
            strongSelf.removeLoader()
        })).disposed(by: disposeBag)
        
        showLoader()
        viewModel?.getNews()
        
        _view.itemHandler = weakify({ strongSelf, newsUrl in
            strongSelf.navigator.navigate(with: .push(strongSelf.viewDIContainer.makeNewsDetailsController(newsUrl: newsUrl)))
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
}

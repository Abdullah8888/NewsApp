//
//  DIContainer.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import Foundation

class ViewDIContainer {
    
    let appDIContainer = AppDIContainer.shared
    static var shared: ViewDIContainer = ViewDIContainer()
    
    func makeNewsController() -> NewsController {
        let vc = NewsController(view: NewsView())
        vc.viewModel = NewsViewModel(getNewsUseCase: appDIContainer.makeGetNewsUseCase())
        return vc
    }
    
    func makeNewsDetailsController(newsUrl: String) -> NewsDetailController {
        let vc = NewsDetailController(view: NewsDetailView())
        vc.newsUrl = newsUrl
        return vc
    }
}

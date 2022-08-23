//
//  NewsViewModel.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import Foundation
import RxSwift

class NewsViewModel {
    var getNewsUseCase: GetNewsUseCaseDelegate
    let news: PublishSubject<News> = PublishSubject<News>()
    let errorHandler: PublishSubject<ErrorModel> = PublishSubject<ErrorModel>()
    
    init(getNewsUseCase: GetNewsUseCaseDelegate) {
        self.getNewsUseCase = getNewsUseCase
    }
    
    func getNews() {
        getNewsUseCase.execute { [weak self] res in
            guard let self = self else { return }
            switch res {
            case .success(let store):
                self.news.onNext(store)
            case .failure(let error):
                self.errorHandler.onNext(error)
            }
        }
    }
}

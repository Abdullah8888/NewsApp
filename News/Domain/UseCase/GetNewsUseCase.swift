//
//  GetNewsUseCase.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import Foundation

protocol GetNewsUseCaseDelegate: AnyObject {
    func execute(completion: @escaping (Result<News, ErrorModel>) -> Void)
}

class GetNewsUseCase: GetNewsUseCaseDelegate {
    
    let newsRepository: NewsRepositoryDelegate
    
    init(newsRepository: NewsRepositoryDelegate) {
        self.newsRepository = newsRepository
    }
    
    func execute(completion: @escaping (Result<News, ErrorModel>) -> Void) {
        newsRepository.fetchNews(completion: completion)
    }
}

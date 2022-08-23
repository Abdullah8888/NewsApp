//
//  NewsRepository.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import Foundation

protocol NewsRepositoryDelegate: AnyObject {
    func fetchNews(completion: @escaping (Result<News, ErrorModel>) -> Void)
}

class NewsRepository: NewsRepositoryDelegate {
    
    let networkService: NetworkServiceDelegate
    let userDefaultManager: UserDefaultManagerDelegate
    
    init(networkService: NetworkServiceDelegate, userDefaultManager: UserDefaultManagerDelegate) {
        self.networkService = networkService
        self.userDefaultManager = userDefaultManager
    }
    
    func fetchNews(completion: @escaping (Result<News, ErrorModel>) -> Void) {
        if userDefaultManager.cacheNews != nil {
            if let cacheNews = userDefaultManager.cacheNews {
                completion(.success(cacheNews))
            }
            else {
                completion(.failure(ErrorModel(message: "Error")))
            }
        }
        else {
            networkService.fetch(relativeUrl: "top-headlines?country=us&apiKey=", method: .get, type: News.self) { result in
                switch result {
                case .success(let res):
                    completion(.success(res))
                case .failure(let error):
                    completion(.failure(ErrorModel(message: error.message)))
                }
            }
        }
    }
}

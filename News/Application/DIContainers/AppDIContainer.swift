//
//  AppDIContainer.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import Foundation

class AppDIContainer {
    
    static var shared: AppDIContainer = AppDIContainer()
    
    func makeNetworkService() -> NetworkServiceDelegate {
        NetworkService()
    }
    
    func makeUserDefault() -> UserDefaultManagerDelegate {
        UserDefaultManager.shared
    }
    
    func makeNewsRepository() -> NewsRepositoryDelegate {
        NewsRepository(networkService: makeNetworkService(), userDefaultManager: makeUserDefault())
    }
    
    func makeGetNewsUseCase() -> GetNewsUseCaseDelegate {
        GetNewsUseCase(newsRepository: makeNewsRepository())
    }
}

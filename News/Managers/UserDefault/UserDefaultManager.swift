//
//  UserDefaultManager.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import Foundation
class UserDefaultManager: UserDefaultManagerDelegate {
    
    static var shared: UserDefaultManagerDelegate = UserDefaultManager()
    
    fileprivate init() {}
    
    @UserDefaultCodable(key: UserDefaultConstants.CACHE_NEWS, default: nil)
    var cacheNews: News?

}

protocol UserDefaultManagerDelegate {
    var cacheNews: News? {get set}
}


//
//  AppConfiguration.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//

import Foundation
class AppConfiguration {
    
    static let baseUrl: String = {
        return Bundle.main.object(forInfoDictionaryKey: "BaseUrl") as! String
    }()
    
    static let apiKey: String = {
        return Bundle.main.object(forInfoDictionaryKey: "ApiKey") as! String
    }()
}

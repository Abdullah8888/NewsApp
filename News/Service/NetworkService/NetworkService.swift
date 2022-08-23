//
//  NetworkService.swift
//  News
//
//  Created by Abdullah on 23/08/2022.
//




import UIKit
import Alamofire

struct ErrorModel: Codable, Error {
    let message: String?
}

protocol NetworkServiceDelegate {
    func fetch<T>(relativeUrl urlString: String, method: HTTPMethod, type: T.Type, completionHandler completion: @escaping (Result<T, ErrorModel>) -> Void) where T : Decodable, T : Encodable
}


class NetworkService: NetworkServiceDelegate {
    
    func fetch<T>(relativeUrl urlPath: String, method: HTTPMethod, type: T.Type, completionHandler completion: @escaping (Result<T, ErrorModel>) -> Void) where T : Decodable, T : Encodable {
 
        guard let url = URL(string: AppConfiguration.baseUrl + urlPath + AppConfiguration.apiKey) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        
        AF.request(request).responseDecodable(of: type.self) { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    if let decodedResponse = try? JSONDecoder().decode(type.self, from: data) {
                        completion(.success(decodedResponse))
                    }
                    else {
                        if let decodedResponse = try? JSONDecoder().decode(ErrorModel.self, from: data) {
                            completion(.failure(decodedResponse))
                        }
                        else {
                            let error = ErrorModel(message: "Unable to parse JSON")
                            completion(.failure(error))
                        }
                    }
                }
                
            case let .failure(error):
                let dd = String(data: response.data!, encoding: .utf8)
                print(dd)
                let error = ErrorModel(message: error.errorDescription)
                completion(.failure(error))
            }
        }
    }
    
}

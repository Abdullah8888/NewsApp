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
    func fetch<T>(relativeUrl urlString: String, method: HTTPMethod, type: T.Type, payload: [String: Any]?, completionHandler completion: @escaping (Result<T, ErrorModel>) -> Void) where T : Decodable, T : Encodable
}


class NetworkService: NetworkServiceDelegate {
    
    func fetch<T>(relativeUrl urlPath: String, method: HTTPMethod, type: T.Type, payload: [String: Any]? = [:], completionHandler completion: @escaping (Result<T, ErrorModel>) -> Void) where T : Decodable, T : Encodable {
        
        /*guard let urlEscapedString = "\(AppConfiguration.baseUrl)\(urlPath)\(AppConfiguration.apiKey)"
            .addingPercentEncoding(withAllowedCharacters: .afURLQueryAllowed) else { return }
         
         */
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=2d021085c2e64c23927ff485d9f4299b") else {
            return
        }
        debugPrint("full url is \(url)")
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        //request.headers = headers
        
        if !(payload?.isEmpty ?? true) {
            request.httpBody = try? JSONSerialization.data(withJSONObject: payload!)
        }
        
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
                let error = ErrorModel(message: error.errorDescription)
                completion(.failure(error))
            }
        }
    }
    
}

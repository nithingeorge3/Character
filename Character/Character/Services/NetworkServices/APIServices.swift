//
//  APIServices.swift
//  Character
//
//  Created by Nitin George on 28/02/2021.
//

import Foundation
import Alamofire

protocol APIServiceProvider {
    var apiService: APIService { get }
}

class APIService {
    func makeCall(request: ServiceRequest, completion: @escaping (_ isSuccess: Bool, _ response:  Data?) -> Void) {
        makeServiceCall(url: request.url, header: request.headers, parameters: request.parameters, method: request.method) { (isSuccess, serviceResponse) in
            completion(isSuccess, serviceResponse)
        }
    }
    
    private func makeServiceCall(url: String, header: HTTPHeaders?, parameters: [String: Any]?, method: HTTPMethod, completion: @escaping (_ isSuccess: Bool, _ response:  Data?) -> Void) {
        AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: URLEncoding.default,
                   headers: header).responseJSON { response in
                    if let responseData = response.data {
                        completion(true, responseData)
                    }
                    else {
                        completion(false, nil)
                    }
                }.resume()        
    }
}

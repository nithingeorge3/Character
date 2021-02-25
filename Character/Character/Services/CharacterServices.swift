//
//  CharacterServices.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import Foundation
import Alamofire

final class CharacterServices: APICharacterProtocol {
    func fetchCharacters(completion: @escaping (Bool, [Character]?) -> Void) {
        let url = "\(AppConfiguration.apiURL)\(kFetchCharacterListURL)"
        let params:[String: Any] = [:]
        let headers :HTTPHeaders = ["Accept":"application/json", "Content-Type":"application/json"]
        let request = ServiceRequest(url: url, headers: headers, parameters: params, method: .get)
        AF.request(request.url,
                   method: request.method,
                   parameters: request.parameters,
                   encoding: URLEncoding.default,
                   headers: request.headers).responseJSON { response in
                    if let responseData = response.data, let decodedResponse = try? JSONDecoder().decode([Character].self, from: responseData) {
                        completion(true, decodedResponse)
                    }
                    else {
                        completion(false, nil)
                    }
                }.resume()
    }
}


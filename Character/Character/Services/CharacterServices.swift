//
//  CharacterServices.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import Foundation
import Alamofire

final class CharacterServices: APICharacterProtocol {
    
    internal var apiService: APIService
    
    init() {
        apiService = APIService()
    }
    
    func fetchCharacters(completion: @escaping (Bool, [Character]?) -> Void) {
        let url = "\(AppConfiguration.apiURL)\(kFetchCharacterListURL)"
        let params:[String: Any] = [:]
        let headers :HTTPHeaders = ["Accept":"application/json", "Content-Type":"application/json"]
        let request = ServiceRequest(url: url, headers: headers, parameters: params, method: .get)
        apiService.makeCall(request: request) { (isSuccess, response) in
            if let data = response, let decodedResponse = try? JSONDecoder().decode([Character].self, from: data) {
                completion(true, decodedResponse)
            }
            else {
                completion(false, nil)
            }
        }
    }
}


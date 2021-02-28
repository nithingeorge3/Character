//
//  ServiceRequest.swift
//  Character
//
//  Created by Nitin George on 24/02/2021.
//

import Alamofire

struct ServiceRequest {
    var url: String
    var headers: HTTPHeaders?
    var parameters: [String: Any]?
    var method: HTTPMethod
}

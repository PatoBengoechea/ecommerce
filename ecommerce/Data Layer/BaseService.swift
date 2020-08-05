//
//  ServiceManager.swift
//  ecommerce
//
//  Created by Patricio Bengoechea on 03/08/2020.
//  Copyright © 2020 Patricio Bengoechea. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - Base Request
class BaseRequest<U: Codable> {
    
    var url: String
    var method: HTTPMethod
    
    init(url: String, method: HTTPMethod) {
        self.url = url
        self.method = method
    }
    
    func performRequest(completion: @escaping (BaseResponse<U>)->()) {
        AF.request(url,
                   method: method,
                   encoding: JSONEncoding.default).responseJSON { (serviceResponse) in
                    let response = BaseResponse<U>().create(response: serviceResponse)
                    completion(response)
        }
    }
}

// MARK: - Base Response
class BaseResponse<T: Codable> {
    var status: Bool
    var data: BaseDataResponse<T>?
    var message: String = ""
    
    init() {
        status = false
        data = nil
        message = "Ha ocurrido un error en la conexión"
    }
    
    func create(response: AFDataResponse<Any>) -> Self {
        if let value = response.data {
            do {
                status = true
                data = try JSONDecoder().decode(BaseDataResponse.self, from: value)
                message = ""
            } catch {
                status = false
                data = nil
                message = error.localizedDescription
            }
        }
        return self
    }
}

// MARK: - Base Data Response
class BaseDataResponse<U: Codable>: Codable {
    var paging: Paging?
    var results: [U]?
    var message: String?
}

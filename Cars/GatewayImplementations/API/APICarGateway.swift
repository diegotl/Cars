//
//  APICarGateway.swift
//  Cars
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

import APIClient

struct APICarGateway: CarGateway {
    
    let apiClient: APIClient
    
    func list(completion: @escaping (Result<[Car], Error>) -> Void) {
        let request = ListCarsRequest()
        apiClient.execute(apiRequest: request) { (result: Result<[Car], APIError>) in
            do {
                let cars = try result.get()
                completion(.success(cars))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
}

//
//  CarGatewayStub.swift
//  CarsTests
//
//  Created by Diego Trevisan Lara on 11/11/19.
//  Copyright © 2019 Diego Trevisan Lara. All rights reserved.
//

@testable import Cars

struct CarGatewayStub: CarGateway {
    
    let result: Result<[Car], Error>
    
    func list(completion: @escaping (Result<[Car], Error>) -> Void) {
        completion(result)
    }
    
}
